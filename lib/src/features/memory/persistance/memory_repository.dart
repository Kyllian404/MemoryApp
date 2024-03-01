import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoryapp/src/exceptions/app_exception.dart';
import 'package:memoryapp/src/features/memory/domain/memo.dart';
import 'package:memoryapp/src/features/memory/persistance/i_memory_repository.dart';
import 'package:memoryapp/src/infrastructure/local_db/i_local_db.dart';

class MemoryRepository implements IMemoryRepository {
  MemoryRepository(this.ref);

  final Ref ref;

  /// Pour lire la memolist
  @override
  Future<List<Memo>> fetchMemo() async {
    /// Liste vide pour recevoir le resultat serialisé
    final result = <Memo>[];

    /// On récupère le Json sur sembast
    final json = await ref.read(localDbProvider).getData('memolist');

    /// Si la liste n'est pas vide on transforme le json en Liste de Memo
    if(json != null && json.isNotEmpty) {
      for (var memo in json) {
        if (memo is Map<String, dynamic>) {
          result.add(Memo.fromJson(memo));
        }
      }
    }

    return result;
  }

  /// Pour ajouter un memo
  @override
  Future<void> setMemo(List<Memo> memos) async {
    //* Liste vide pour recevoir le resultat serialisé
    final datas = <Map<String, dynamic>>[];

    try{
    //* Si la liste n'est pas vide on transforme le json en Liste de Memo
    if(memos.isNotEmpty) {
      for (Memo memo in memos){
        datas.add(memo.toJson());
      }
    //* Puis on envoie le Json sur sembast  
    await ref.read(localDbProvider).setData('memolist', datas);
    }
    } catch (e) {
      throw AppException.unknownError();
    }
  }

 /// Pour supprimer un memo de la challengeList
  @override
  Future<void> cleanGuess(int memoId) async {
    try {
  // On récupère la liste actuelle des Memos
  final currentList = await fetchMemo();
  
  // Vérifie si l'index est valide
  if (memoId < 0 || memoId >= currentList.length) {
    throw AppException.unknownError();
  }
  
  // On supprime le memo à l'index spécifié
  currentList.removeAt(memoId);

  // On transforme la liste mise à jour en JSON
  final List<Map<String, dynamic>> updatedListJson = currentList.map((memo) => memo.toJson()).toList();

  // On enregistre la nouvelle liste dans la base de données
  await ref.read(localDbProvider).setData('memolist', updatedListJson);
} catch (e) {
  throw AppException.unknownError();
}
  }

 /// Pour vider la challengeList
  @override
  Future<void> cleanChallenge() async {
    try {
      //* On vide la valeur challengeList sur sembast
      ref.read(localDbProvider).setData('memolist', []);
    } catch (e) {
      throw AppException.unknownError();
    }
  }

}