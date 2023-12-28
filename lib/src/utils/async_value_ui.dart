import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Extention pour la gestion de l'interface d'un widget associé à un
/// controller
extension AsyncValueUI on AsyncValue {
  /// Permet de faire apparaitre une popup en cas d'erreur retournée par un
  /// controller
  void showAlertDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text(error.toString()),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }
}