import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoryapp/src/app.dart';
import 'package:memoryapp/src/infrastructure/local_db/i_local_db.dart';
import 'package:memoryapp/src/infrastructure/local_db/sembast/my_sembast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///* Initialisation des dépendances (infrastucture)
  try {
    final ILocalDb localDb = await MySembast.initDb();
    final container = ProviderContainer(
      overrides: [
        localDbProvider.overrideWithValue(localDb),
      ],
    );

    container.read(localDbProvider);

    runApp(
      UncontrolledProviderScope(
        container: container,
        child: const MyApp(),
      ),
    );
  } catch (e) {
    // Gérer l'erreur d'initialisation
    print("Erreur lors de l'initialissation de la base de données Sembast: $e");
  }
}
