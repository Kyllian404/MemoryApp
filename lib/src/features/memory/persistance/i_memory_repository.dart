import 'package:memoryapp/src/features/memory/domain/memo.dart';
import 'package:memoryapp/src/features/memory/persistance/memory_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'i_memory_repository.g.dart';

/// Repository de la memolist, gère les échanges avec la base de données sembast
abstract class IMemoryRepository {
  Future<List<Memo>> fetchMemo();
  Future<void> setMemo(List<Memo> memos);
  Future<void> cleanChallenge();
}

@Riverpod(keepAlive: true)
IMemoryRepository memoryRepository (MemoryRepositoryRef ref) {
  return MemoryRepository(ref);
}