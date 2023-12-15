import 'package:memoryapp/src/features/memory/domain/memo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:memoryapp/src/features/memory/persistance/i_memory_repository.dart';

part 'memo_providers.g.dart';

@Riverpod(keepAlive: true)
class MemoList extends _$MemoList {
  @override
  FutureOr<List<Memo>> build() {
    return init();
  }

  Future<List<Memo>> init() async {
    return ref.read(memoryRepositoryProvider).fetchMemo();
  }

  void change(List<Memo> memos) {
    state = AsyncValue.data(memos);
  }
}
