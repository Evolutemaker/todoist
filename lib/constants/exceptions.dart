class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
}

class ComplexException implements Exception {
  final String message;
  ComplexException(this.message);
}

class WrongAuthException implements Exception {
  final String message;
  WrongAuthException(this.message);
}

class NoElementFoundException implements Exception {
  final String message;
  NoElementFoundException(this.message);
}

class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}
