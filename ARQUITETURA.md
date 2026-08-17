# Arquitetura e decisões técnicas

Documento de referência do projeto: como ele está organizado, por que cada
decisão foi tomada, como os dados atravessam o app e onde mexer quando o
escopo crescer.

---

## 1. Ponto de partida

O escopo pedido é pequeno (listar, buscar, cadastrar, persistir), mas o
enunciado avalia a entrega **como a primeira etapa de um projeto complexo**.
Isso guiou todas as escolhas: em vez de resolver as três telas do jeito mais
curto, o projeto define **fronteiras** — onde a regra de negócio mora, onde a
API mora, onde o banco mora — de forma que a próxima regra de negócio entre em
um lugar óbvio, sem reescrever o que já existe.

O custo dessa decisão é honesto: há mais arquivos do que um app deste tamanho
exigiria. O ganho é que nenhum deles precisa mudar quando outro muda.

---

## 2. Camadas

Clean Architecture em três camadas, organizadas **por feature** (`features/posts/`)
e não por tipo de arquivo. Uma feature nova é uma pasta nova; nada é diluído em
diretórios globais de "models" e "services".

```
┌─────────────────────────────────────────────────────────────┐
│ presentation   páginas, widgets, controllers, estados de UI │
│                conhece: domain                              │
├─────────────────────────────────────────────────────────────┤
│ domain         entidades, contratos, casos de uso, validação│
│                conhece: nada (nem Flutter, nem Dio, nem SQL)│
├─────────────────────────────────────────────────────────────┤
│ data           DTOs, datasources, repositório concreto      │
│                conhece: domain + Dio + Drift                │
└─────────────────────────────────────────────────────────────┘
```

**A seta de dependência aponta sempre para dentro.** `data` implementa uma
interface declarada por `domain` (`PostRepository`); `domain` nunca importa
`data`. É a inversão de dependência que permite trocar API ou banco sem tocar
em regra de negócio, e testar regra de negócio sem subir infraestrutura.

### `core/` — o que não pertence a uma feature

| Arquivo | Papel |
| --- | --- |
| `core/error/failure.dart` | Union de falhas do domínio (`timeout`, `noConnection`, `server`, `serialization`, `cache`, `validation`, `unexpected`), cada uma com mensagem pronta para a UI |
| `core/typedefs.dart` | `typedef Result<T> = Either<Failure, T>` |
| `core/network/api_endpoints.dart` | URLs em um lugar só |
| `core/network/dio_factory.dart` | Cliente HTTP configurado (timeouts, headers, log em debug) |
| `core/network/network_failure_mapper.dart` | Único ponto do app que conhece `DioException` |
| `core/database/app_database.dart` | Banco Drift, versão do schema e migração |
| `core/database/tables/post_rows.dart` | Definição da tabela |
| `core/utils/text_normalizer.dart` | Normalização de texto para busca (minúsculas, sem acentos) |

---

## 3. Chamadas de API

Base: `https://jsonplaceholder.typicode.com`

### 3.1 `GET /posts` — listar

Disparado ao abrir a listagem e no *pull-to-refresh*.

```dart
PostListController.load()
  └─ GetPosts()
       └─ PostRepositoryImpl.getPosts()
            ├─ DioPostRemoteDataSource.fetchPosts()      → GET /posts
            ├─ DriftPostLocalDataSource.replaceRemoteCache(...)   (grava)
            └─ DriftPostLocalDataSource.readAll()                 (lê)
```

Resposta esperada — lista de objetos:

```json
[{ "userId": 1, "id": 1, "title": "sunt aut facere", "body": "quia et suscipit" }]
```

Cada item vira um `PostDto`, depois um `Post` de origem `remote` com chave
`remote-<id>`.

### 3.2 `POST /posts` — cadastrar

```dart
PostFormController.submit(title, body)
  └─ CreatePost(draft)                         ← valida antes de gastar rede
       └─ PostRepositoryImpl.create(draft)
            ├─ DioPostRemoteDataSource.createPost(draft)   → POST /posts
            └─ DriftPostLocalDataSource.saveLocalPost(post)      (grava)
```

Corpo enviado (sem `id` — quem atribui é o servidor):

```json
{ "userId": 1, "title": "…", "body": "…" }
```

Resposta da JSONPlaceholder: `201` com `id: 101` — **sempre o mesmo**, e nada
é gravado no servidor. Como o app trata isso está na seção 5.

### 3.3 Tratamento de erro

Erro de infraestrutura nunca sobe cru. A conversão acontece na fronteira da
camada de dados:

| Origem | Vira |
| --- | --- |
| `DioExceptionType.connectionTimeout` / `sendTimeout` / `receiveTimeout` | `Failure.timeout()` |
| `DioExceptionType.connectionError` | `Failure.noConnection()` |
| `DioExceptionType.badResponse` | `Failure.server(statusCode, body)` |
| JSON fora do contrato | `Failure.serialization(...)` |
| Erro de leitura/escrita no SQLite | `Failure.cache(...)` |
| Rascunho inválido | `Failure.validation({campo: mensagem})` |

Toda operação falível devolve `Result<T> = Either<Failure, T>`. **Falha é
valor, não exceção**: o compilador obriga quem chama a tratar os dois lados, e
nenhuma camada acima de `data` tem `try/catch`.

---

## 4. Persistência local

### Por que SQLite (Drift), e não chave-valor

Os dados já são relacionais (um post pertence a um autor) e o enunciado pede
uma solução que suporte crescimento. Com SQLite via Drift o projeto ganha, sem
reescrita futura: consultas e ordenação no banco, índices quando o volume
exigir, **migrações versionadas** (`schemaVersion`) e transações. Guardar uma
lista serializada em `SharedPreferences` resolveria hoje e cobraria caro no
primeiro requisito novo.

Drift especificamente por ser tipado em tempo de compilação — uma coluna
renomeada quebra o build, não a execução.

### A tabela

```dart
class PostRows extends Table {
  TextColumn     get id        => text()();                 // PK: remote-<id> | local-<uuid>
  IntColumn      get remoteId  => integer().nullable()();   // id devolvido pela API
  IntColumn      get userId    => integer()();
  TextColumn     get title     => text()();
  TextColumn     get body      => text()();
  TextColumn     get origin    => textEnum<PostOrigin>()(); // remote | local
  DateTimeColumn get createdAt => dateTime()();
}
```

Duas decisões nessa tabela:

- **Uma tabela só, com coluna de origem.** Cache da API e posts do usuário
  convivem, o que mantém a leitura da lista em uma consulta ordenada. A coluna
  `origin` é o que garante que uma sincronização **nunca** apague o que o
  usuário criou: `replaceRemoteCache` só remove linhas `remote`.
- **Enum e data como texto.** O enum é gravado pelo nome (reordenar valores no
  Dart não corrompe linhas já no aparelho) e as datas em ISO-8601, preservando
  o instante exato.

### Ordem da lista

`readAll()` devolve: posts do usuário primeiro, do mais recente para o mais
antigo; depois os da API, na ordem do servidor. São duas consultas — cada
origem tem seu critério de ordenação, e separá-las deixa isso explícito.

---

## 5. O ponto central: a API não persiste nada

A JSONPlaceholder simula a criação. Ela responde `201 { "id": 101 }` para
qualquer `POST`, não grava e não devolve esse post no `GET` seguinte. Um app
ingênuo teria dois bugs imediatos: dois posts criados em sequência colidiriam
no `id: 101`, e o post desapareceria no primeiro *refresh*.

A política adotada:

1. O `POST` é enviado de verdade e precisa ter sucesso.
2. O post recebe **identidade própria** — `local-<uuid>` — e origem `local`.
3. O `id` devolvido pela API é guardado em `remoteId`, apenas como rastro.
4. O conteúdo salvo é **o que o usuário digitou**, não o eco do servidor.
5. Ele é gravado no SQLite e, por ser `local`, nenhuma sincronização o remove.
6. A listagem o exibe no topo, com o selo "Meu post".

Consequência visível: o post criado continua lá depois de fechar e reabrir o
app — que é exatamente o que o teste pede.

**Se o `POST` falhar**, nada é salvo e o formulário mostra o erro, permitindo
nova tentativa. É a escolha previsível para este escopo. A evolução natural
seria o padrão *outbox*: salvar o post com estado `pending`, exibi-lo já na
lista e reenviar em segundo plano — o modelo de dados já comporta isso (basta
uma coluna de estado de sincronização), mas sincronização em background está
explicitamente fora do escopo do teste.

---

## 6. Estratégia offline

`getPosts()` sempre tenta a rede e sempre lê a lista final **do banco**. Um
único caminho de leitura, idêntico online e offline.

| Situação | Resultado |
| --- | --- |
| Rede ok | `PostFeed(source: network)` — cache atualizado |
| Rede falhou, há cache | `PostFeed(source: cache, syncFailure: ...)` — a tela exibe a lista com uma faixa de aviso |
| Rede falhou, cache vazio | `Left(Failure)` — tela de erro com "Tentar novamente" |
| Banco falhou | `Left(Failure.cache)` |

O tipo `PostFeed` existe para isso: devolver apenas `List<Post>` esconderia do
usuário a diferença entre "dados de agora" e "dados de ontem porque a rede
caiu". Falha de sincronização degrada a experiência, não a interrompe.

---

## 7. Gerenciamento de estado

**`ChangeNotifier` + `provider`.**

A superfície de estado do app é pequena: uma lista, um texto de busca, um
formulário. `ChangeNotifier` já vem no Flutter e o `provider` cuida apenas de
injeção e escuta — não impõe estrutura ao restante do código. Bloc ou Riverpod
resolveriam igual, com mais cerimônia para o mesmo resultado.

O ponto que torna a escolha reversível: **o `provider` só aparece em
`presentation/` e no composition root**. Trocar por outra solução significa
reescrever dois controllers; domínio e dados não sabem que ele existe.

### Estados como unions

```dart
PostListState = initial | loading | loaded(posts, isRefreshing, staleFailure?) | error(failure)
PostFormState = editing | submitting | success(post) | failure(failure)
```

Com `isLoading` + `errorMessage` + `data` soltos, existem combinações
impossíveis (carregando *e* com erro) que a tela precisa desempatar na mão. Com
o union fechado, cada variante tem exatamente uma tela e o `switch` da página é
uma correspondência direta.

### Detalhes de comportamento que os testes fixam

- Recarregar por cima de uma lista visível **não** a apaga: o estado vira
  `loaded(isRefreshing: true)`, mantendo os posts na tela.
- O texto de busca sobrevive ao *refresh*.
- A lista filtrada é **derivada** (`visiblePosts`), nunca armazenada: não há
  dois estados para manter em sincronia.
- Toque duplo em "Publicar" não cria dois posts — o segundo envio é ignorado
  enquanto o primeiro está em andamento.
- Após criar, a lista insere o post recebido no topo **sem nova ida à rede**.

---

## 8. Formulário e validação

As regras vivem em `domain/validation/post_validators.dart` — não no widget:

| Campo | Regras |
| --- | --- |
| Título | obrigatório, 3 a 100 caracteres, espaços das pontas ignorados |
| Descrição | obrigatória, até 500 caracteres |

A mesma função alimenta **os dois níveis**:

- o `validator:` de cada `TextFormField`, que dá feedback imediato e impede o
  envio;
- o caso de uso `CreatePost`, que revalida antes de gastar rede e devolve
  `Failure.validation({campo: mensagem})`.

Fonte única de verdade: qualquer outro ponto de entrada futuro (deep link,
importação em lote, outra tela) herda a mesma garantia sem duplicar regra.

---

## 9. Busca

Filtro local, em `FilterPostsByTitle`, aplicado apenas ao **título** (como
pedido). Normaliza os dois lados da comparação: minúsculas e sem acentos, então
`persistencia` encontra `Persistência`.

A busca é local por decisão consciente — a JSONPlaceholder não tem endpoint de
busca e a lista inteira já está em memória e no banco. Isolá-la em um caso de
uso torna a migração para busca no servidor (ou para um índice FTS do SQLite,
quando o volume justificar) uma mudança de uma classe só.

---

## 10. Bibliotecas e por quê

| Pacote | Papel | Por que este |
| --- | --- | --- |
| `provider` | Injeção + escuta de estado | Mínimo necessário; oficialmente recomendado; não impõe arquitetura |
| `dio` | Cliente HTTP | Timeouts, interceptors e `HttpClientAdapter` substituível — os testes exercitam o cliente real sem rede |
| `drift` + `sqlite3_flutter_libs` | Persistência SQLite | Consultas tipadas em tempo de compilação, migrações versionadas, `NativeDatabase.memory()` nos testes |
| `path_provider` / `path` | Local do arquivo do banco | Caminho correto por plataforma |
| `freezed` | Imutabilidade, unions, `copyWith`, igualdade | Estados e entidades sem boilerplate; igualdade estrutural simplifica os testes |
| `json_serializable` | Parsing de JSON | Sem `fromJson` escrito à mão, que erra em silêncio |
| `fpdart` | `Either` | Erro esperado como valor, verificado pelo compilador |
| `uuid` | Identidade dos posts locais | A API não fornece id utilizável |
| `mocktail` (dev) | Dublês nos testes | Sem geração de código, sem `build_runner` no ciclo de teste |

## 11. Testes

**94 testes**, escritos em TDD — o teste veio primeiro em cada passo, e cada um
falhou antes de a implementação existir.

| Camada | Arquivo | O que cobre |
| --- | --- | --- |
| Core | `network_failure_mapper_test` | Cada tipo de erro do Dio → a `Failure` certa |
| Domínio | `post_validators_test` | Limites e obrigatoriedade dos campos |
| Domínio | `filter_posts_by_title_test` | Case, acentos, parcial, sem resultado, nunca busca no corpo |
| Domínio | `create_post_test` | Validação, `trim`, propagação de falha |
| Domínio | `get_posts_test` | Delegação e propagação |
| Dados | `post_dto_test` | Parsing do payload real e conversão para entidade |
| Dados | `post_local_data_source_test` | **SQLite real em memória**: ordenação, upsert, e a garantia de que sincronizar não apaga post do usuário |
| Dados | `post_remote_data_source_test` | **Dio real** com `HttpClientAdapter` falso: método, path, corpo enviado, erros HTTP, payload malformado |
| Dados | `post_repository_impl_test` | Fallback para cache, identidade do post criado, cada caminho de erro |
| Apresentação | `post_list_controller_test` | Transições de estado, busca, refresh não destrutivo |
| Apresentação | `post_form_controller_test` | Envio, erro, retry, envio duplo |
| Apresentação | `post_list_page_test` | Loading, lista, busca, vazio, erro + retry, aviso de cache, navegação, criar post |
| Apresentação | `post_form_page_test` | Validação na tela, envio, erro, botão desabilitado durante o envio |
| Apresentação | `post_search_field_test` | Botão de limpar aparece só com texto, limpa o campo e avisa quem escuta |
| Integração | `app_widget_test` | App inteiro montado: HTTP falso → repositório real → SQLite real → tela |

Onde os dublês param: **as fronteiras reais não são mockadas.** O teste do
banco usa SQLite de verdade; o teste do cliente HTTP usa Dio de verdade,
trocando só o socket. Mocks aparecem apenas entre camadas do próprio projeto.

---

## 12. Onde mexer quando crescer

| Necessidade | Onde |
| --- | --- |
| Novo endpoint / nova feature | Nova pasta em `features/`, mesmo desenho de camadas |
| Trocar o cliente HTTP | `data/datasources/` + `core/network/` — domínio e UI intactos |
| Trocar o banco | Nova implementação de `PostLocalDataSource` |
| Busca no servidor | Substituir `FilterPostsByTitle` por uma chamada no repositório |
| Reenvio offline (*outbox*) | Coluna de estado de sincronização em `PostRows` + serviço de fila |
| Regra de negócio nova | Caso de uso em `domain/usecases/` |
| Trocar o gerenciador de estado | Reescrever os dois controllers em `presentation/` |
| Paginação | `getPosts()` passa a receber cursor; o banco já suporta `limit/offset` |
