import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoryapp/src/exceptions/app_exception.dart';
import 'package:memoryapp/src/features/memory/application/providers/memo_providers.dart';
import 'package:memoryapp/src/features/memory/persistance/i_memory_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remove_memo_challenge_list_use_case.g.dart';

class RemoveMemoChallengeListUseCase {
  RemoveMemoChallengeListUseCase(this.ref);

  final Ref ref;

  Future<void> execute(int positionId) async {
    try {
      final repo = ref.read(memoryRepositoryProvider);
      final datas = ref.read(memoListProvider);

      if (datas.hasValue) {
        final memoList = datas.value!;

        if (positionId < 0 || positionId >= memoList.length) {
          throw AppException.unknownError();
        }

        memoList.removeAt(positionId);

        await repo.cleanGuess(memoList);

        ref.read(memoListProvider.notifier).change(memoList);
      }
    } catch (e) {
      throw AppException.unknownError();
    }
  }
}

@riverpod
RemoveMemoChallengeListUseCase removeMemoChallengeListUseCase(
    RemoveMemoChallengeListUseCaseRef ref) {
  return RemoveMemoChallengeListUseCase(ref);
}
