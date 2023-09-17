class ServerException implements Exception {
  final String message;

  ServerException({this.message = 'Server Failure'});
}

class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);
}
