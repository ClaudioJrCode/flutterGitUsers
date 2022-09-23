import 'package:git_users/core/adapters/http/client_response.dart';

abstract class IHttpClient {
  Future<ClientResponse> post(
    String url, {
    dynamic body,
  });

  Future<ClientResponse> get(
    String url, {
    Map<String, String>? headers,
  });

  Future<ClientResponse> delete(
    String url, {
    dynamic body,
  });
}
