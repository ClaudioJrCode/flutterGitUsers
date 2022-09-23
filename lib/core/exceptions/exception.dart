import 'package:flutter/material.dart';

abstract class Failure implements Exception {
  final String message;

  Failure({
    required this.message,
    StackTrace? stackTrace,
  }) {
    if (stackTrace != null) {
      debugPrintStack(stackTrace: stackTrace);
    }
  }

  @override
  String toString() => '$runtimeType: $message';
}

class HttpFailure extends Failure {
  HttpFailure({
    required String message,
    StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class BasicError extends Failure {
  BasicError({required super.message});
}
