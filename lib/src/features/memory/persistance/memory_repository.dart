import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final json = ref.read(localDbProvider).getData('memolist') as List<Map<String, dynamic>>;

    /// Si la liste n'est pas vide on transforme le json en Liste de Memo
    if(json.isNotEmpty) {
      json.map((memo) => result.add(Memo.fromJson(memo)));
    }

    return result;
  }

  /// Pour ajouter un todo
  @override
  Future<void> setMemo(List<Memo> memos) async {
    final datas = <Map<String, dynamic>>[];
    if(memos.isNotEmpty) {
      memos.map((memo) => datas.add(memo.toJson()));
    ref.read(localDbProvider).setData('memolist', memos);
    }
  }
}