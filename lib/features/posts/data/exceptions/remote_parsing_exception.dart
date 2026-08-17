class RemoteParsingException implements Exception {
  const RemoteParsingException(this.details);

  final String details;

  @override
  String toString() => 'RemoteParsingException: $details';
}
