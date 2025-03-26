abstract class AppException implements Exception {
  final String message;
  const AppException(this.message);
  @override
  String toString() => message;
}

class RemoteException extends AppException {
  const RemoteException(super.message);
}

class LocalException extends AppException {
  const LocalException(super.message);
}
