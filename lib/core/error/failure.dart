import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const Failure._();

  const factory Failure.timeout() = TimeoutFailure;

  const factory Failure.noConnection() = NoConnectionFailure;

  const factory Failure.server({int? statusCode, String? body}) = ServerFailure;

  const factory Failure.serialization(String details) = SerializationFailure;

  const factory Failure.cache(String details) = CacheFailure;

  const factory Failure.validation(Map<String, String> fieldErrors) =
      ValidationFailure;

  const factory Failure.unexpected(String details) = UnexpectedFailure;

  String get message => when(
    timeout: () => 'A conexão demorou demais para responder. Tente novamente.',
    noConnection: () =>
        'Não foi possível conectar. Verifique sua conexão com a internet.',
    server: (statusCode, _) =>
        'O servidor respondeu com erro${statusCode != null ? ' ($statusCode)' : ''}.',
    serialization: (_) => 'Recebemos uma resposta em formato inesperado.',
    cache: (_) => 'Não foi possível acessar os dados salvos no dispositivo.',
    validation: (_) => 'Revise os campos destacados e tente novamente.',
    unexpected: (_) => 'Algo inesperado aconteceu. Tente novamente.',
  );
}
