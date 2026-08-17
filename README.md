# json_placeholder_test

App Flutter que consome a [JSONPlaceholder](https://jsonplaceholder.typicode.com/posts),
lista os posts com busca por título, permite cadastrar novos posts via formulário
validado e mantém tudo disponível offline em um banco SQLite local.

> A explicação completa de arquitetura, fluxos e decisões está em
> **[ARQUITETURA.md](ARQUITETURA.md)**.

## O que o app faz

- **Listagem** — `GET /posts`, exibindo título e descrição em cards.
- **Busca** — filtro local por título, sem diferenciar maiúsculas nem acentos.
- **Cadastro** — formulário com título e descrição, validados, enviados via
  `POST /posts`. O post criado aparece imediatamente no topo da lista e
  sobrevive ao fechamento do app.
- **Detalhe** — toque em um item abre a página com o conteúdo completo.
- **Offline** — sem rede, a lista salva no dispositivo é exibida com um aviso
  de que os dados podem estar desatualizados.

## Como executar

Pré-requisitos: Flutter **3.44.7** (stable) ou superior.

```bash
flutter pub get

# Código gerado (freezed / json_serializable / drift).
dart run build_runner build --delete-conflicting-outputs

flutter run                # ou: -d windows | -d linux | -d chrome | -d <device>
```

### Testes e qualidade

```bash
flutter test                          # 94 testes
flutter test --coverage
flutter test test/caminho/arquivo_test.dart
flutter test --name "trecho do nome"

flutter analyze
dart format .
```

### Builds

```bash
flutter build apk --release --split-per-abi   # Android
flutter build windows --release               # Windows
flutter build linux --release                 # Linux
```

### Debugging

`flutter run` já roda em modo debug (hot reload com `r`, hot restart com `R`).

```bash
flutter devices                # lista devices e emuladores conectados
flutter run -d emulator-5554   # Android (id vem do comando acima)
flutter run -d windows         # Windows
flutter run -d linux           # Linux
```

Sem emulador aberto: `flutter emulators` lista os disponíveis e
`flutter emulators --launch <id>` inicia um. Em aparelho físico, é preciso
ativar *Depuração USB* nas opções do desenvolvedor.

Os workflows em `.github/workflows/` cobrem os dois lados:
`ci.yml` (formatação, código gerado atualizado, análise estática e testes com
cobertura, em todo push e PR) e `release.yml` (binários de Android, Linux e
Windows, publicados como artefatos e anexados à release em tags `v*`).

## Decisões técnicas

O escopo é pequeno, mas o enunciado avalia a entrega como a primeira etapa de um
projeto grande. Cada escolha abaixo foi feita para que o **próximo** requisito
tenha um lugar óbvio para entrar — e cada uma tem um custo, declarado junto.

**Arquitetura — Clean Architecture em três camadas, organizada por feature.**
`domain` não importa Flutter, Dio nem Drift: são entidades, contratos e casos de
uso em Dart puro. `data` implementa a interface que `domain` declara
(`PostRepository`), então a seta de dependência aponta sempre para dentro. É essa
inversão que permite trocar API ou banco sem tocar em regra de negócio, e testar
regra de negócio sem subir infraestrutura. A organização é por feature
(`features/posts/`), não por tipo de arquivo: feature nova é pasta nova, em vez
de mais três linhas em diretórios globais de `models/` e `services/`.
*Custo:* mais arquivos do que este app exigiria. *Ganho:* nenhum deles muda
quando outro muda.

**Estado — `ChangeNotifier` + `provider`.**
A superfície de estado é uma lista, um texto de busca e um formulário.
`ChangeNotifier` já vem no framework e o `provider` faz só injeção e escuta, sem
impor estrutura ao resto do código. Bloc ou Riverpod chegariam ao mesmo resultado
com mais cerimônia. O que torna a escolha reversível é o isolamento: `provider`
aparece apenas em `presentation/` e no composition root (`AppWidget`), que recebe
`AppDatabase` e `Dio` por construtor — trocar de gerenciador significa reescrever
dois controllers, e os testes de widget injetam dublês sem service locator.

**Estados de tela — unions `freezed`.**
`PostListState` é `initial | loading | loaded(posts, isRefreshing, staleFailure?) | error`.
Com `isLoading` + `errorMessage` + `data` soltos existem combinações impossíveis
(carregando *e* com erro) que a tela precisa desempatar na mão; com o union
fechado, cada variante tem exatamente uma tela e o `switch` da página é
correspondência direta. É o que permite o refresh não destrutivo — recarregar por
cima de uma lista visível vira `loaded(isRefreshing: true)`, sem piscar a tela.

**Erros — `Either<Failure, T>` (`fpdart`).**
Falha esperada é valor de retorno, não exceção. `DioException` morre em um único
ponto do app (`NetworkFailureMapper`) e vira uma `Failure` de domínio; acima de
`data` não existe `try/catch`. O ganho concreto é o compilador cobrar o
tratamento dos dois lados em quem chama, em vez de um `catch` esquecido virar
crash em produção.

**HTTP — `dio`.**
Timeouts por fase, interceptors e, o que pesou mais, `HttpClientAdapter`
substituível: os testes exercitam o cliente **real** — método, path, corpo,
tratamento de 4xx/5xx e payload malformado — trocando só o socket, sem mockar o
próprio Dio.

**Persistência — `drift` sobre SQLite, não chave-valor.**
Os dados já são relacionais e o requisito é suportar crescimento. SQLite entrega
consultas e ordenação no banco, índices quando o volume pedir, transações e
**migrações versionadas**; uma lista serializada em `SharedPreferences`
resolveria hoje e cobraria caro no primeiro requisito novo. Drift especificamente
por ser tipado em tempo de compilação — coluna renomeada quebra o build, não a
execução — e por `NativeDatabase.memory()` nos testes. Uma tabela única com
coluna `origin` (`remote | local`) mantém a leitura da lista em uma consulta
ordenada e garante o invariante central: sincronizar remove só linhas `remote`,
nunca o que o usuário criou.

**Modelos — `freezed` + `json_serializable`, com DTO separado da entidade.**
Imutabilidade, `copyWith` e igualdade estrutural (que simplifica asserção em
teste) sem boilerplate, e `fromJson` gerado em vez de escrito à mão, que erra em
silêncio. `PostDto` conhece o formato do JSON; `Post` é a entidade de domínio.
São duas classes de propósito porque mudança no contrato da API para no
`fromJson` do DTO — não vaza para domínio e UI.

**Validação — fonte única em `domain/validation/`.**
As mesmas funções alimentam o `validator:` do `TextFormField` (feedback imediato)
e o caso de uso `CreatePost`, que revalida antes de gastar rede e devolve
`Failure.validation({campo: mensagem})`. Qualquer ponto de entrada futuro herda a
regra sem duplicá-la.

**Testes — TDD, 94 testes.**
O teste veio primeiro em cada passo. A regra de onde os dublês param: **fronteira
real não se mocka** — o teste do banco usa SQLite de verdade, o do cliente HTTP
usa Dio de verdade, e há um teste que monta o app inteiro (HTTP falso →
repositório real → SQLite real → tela). Mock só entre camadas do próprio projeto.
São os testes que fixam os invariantes: sincronização não apaga post do usuário,
falha de rede com cache degrada em aviso e não em tela de erro, toque duplo em
"Publicar" não cria dois posts.

## Estrutura

```bash
lib/
├── app/            # composition root, tema
├── core/           # erro, rede, banco, utilitários compartilhados
└── features/posts/
    ├── domain/     # entidades, contratos, casos de uso, validação
    ├── data/       # DTOs, datasources (API e SQLite), repositório
    └── presentation/  # controllers, estados, páginas, widgets
```

## Limitações conhecidas

- **A API é simulada.** A JSONPlaceholder responde `201` ao `POST` mas não
  grava nada e devolve sempre `id: 101`. Por isso o post criado recebe uma
  identidade local própria e é persistido no dispositivo — ver ARQUITETURA.md.
- **Web não é alvo.** O banco usa `drift` sobre `dart:ffi`; rodar na web exige
  a variante WASM do drift, fora do escopo deste teste.
- **Sem fila de reenvio.** Se o `POST` falhar, o post não é salvo e o usuário
  é avisado para tentar de novo. O caminho de evolução (padrão *outbox*) está
  descrito na documentação de arquitetura.
- **Windows com espaço no caminho do usuário.** O *build hook* de native assets
  do `objective_c` (dependência transitiva de `path_provider_foundation`) é
  chamado com o caminho do pub cache sem aspas e falha se ele contiver espaço,
  derrubando o `flutter test`. Solução, uma vez por máquina:
  `[Environment]::SetEnvironmentVariable('PUB_CACHE','C:\pub-cache','User')`.
