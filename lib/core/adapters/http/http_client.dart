import 'package:git_users/core/adapters/http/client_extension.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'client_response.dart';
import 'http_interface.dart';

class HttpClient implements IHttpClient {
  Future<ClientResponse> _prepareRequest(Future<Response> action) async {
    try {
      final response = await action;
      return response.toClientResponse();
    } catch (error) {
      throw error.toString();
    }
  }

  @override
  Future<ClientResponse> post(
    String url, {
    dynamic body,
    Map<String, String>? headers,
    void Function(int, int)? onSendProgress,
  }) async {
    return await _prepareRequest(
      http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      ),
    );
  }

  @override
  Future<ClientResponse> get(
    String url, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      return response.toClientResponse();
    } catch (error) {
      throw error.toString();
    }
  }

  @override
  Future<ClientResponse> delete(
    String url, {
    dynamic body,
    Map<String, String>? headers,
  }) async {
    return await _prepareRequest(
      http.delete(Uri.parse(url), body: body, headers: headers),
    );
  }
}
