import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:memoryapp/src/exceptions/i_app_exception.dart';

part 'app_exception.freezed.dart';

/// Exceptions globales de l'application
@freezed
class AppException extends IAppException with _$AppException {
  AppException._();

  /// Erreur inconnue
  factory AppException.unknownError() = _UnknownError;

  // @override
  // String get code {
  //   return when(
  //     unknownError: () =>
  //         "unknown-error",
  //   );
  // }

  /// Récupère le message associé à l'erreur
  @override
  String get message {
    return when(
      unknownError: () =>
          "Une erreur inconnue est survenue. Veuillez réessayer plus tard ou contacter le support si le problème persiste.",
    );
  }
}