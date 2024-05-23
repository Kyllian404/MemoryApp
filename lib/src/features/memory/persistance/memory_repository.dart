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
    final result = <Memo>[];

    final json = await ref.read(localDbProvider).getData('memolist');

    if (json != null && json.isNotEmpty) {
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
    final datas = <Map<String, dynamic>>[];

    try {
      if (memos.isNotEmpty) {
        for (Memo memo in memos) {
          datas.add(memo.toJson());
        }

        await ref.read(localDbProvider).setData('memolist', datas);
      }
    } catch (e) {
      throw AppException.unknownError();
    }
  }

  /// Pour supprimer un memo de la challengeList
  @override
  Future<void> cleanGuess(List<Memo> memos) async {
    try {
      final List<Map<String, dynamic>> updatedListJson =
          memos.map((memo) => memo.toJson()).toList();

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
