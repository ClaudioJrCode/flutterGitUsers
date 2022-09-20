import 'dart:convert';

import 'package:git_users/core/adapters/http/client_response.dart';
import 'package:http/http.dart';

extension ClientResponseExt on Response {
  ClientResponse toClientResponse() => ClientResponse(
        body: jsonDecode(body),
        statusCode: statusCode,
      );
}
