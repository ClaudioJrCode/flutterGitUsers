class ClientResponse {
  const ClientResponse({
    required this.body,
    required this.statusCode,
  });

  final dynamic body;
  final int statusCode;
}
