class AuthException implements Exception {
  final _message;
  final _prefix;

  AuthException([this._message, this._prefix]);
  @override
  String toString() {
    return '$_prefix $_message';
  }
}

class FetchDataException extends AuthException {
  FetchDataException([String? message]): super(message, 'Error During Coomunication');
}

class BadRequestException extends AuthException {
  BadRequestException([String? message]): super(message, 'Invalid Request!');
}

class UnauthorizedException extends AuthException {
  UnauthorizedException([String? message]): super(message, 'Unauthorized Request');
}

class InvalidInputException extends AuthException {
  InvalidInputException([String? message]): super(message, 'Invalid Input!');
}