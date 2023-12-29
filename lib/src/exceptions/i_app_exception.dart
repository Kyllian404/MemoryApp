/// Interface des Exceptions de l'application
abstract class IAppException implements Exception {
  // String get code;
  String get message;

  @override
  String toString() => message;
}