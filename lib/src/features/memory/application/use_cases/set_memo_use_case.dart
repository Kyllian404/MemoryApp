import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoryapp/src/exceptions/app_exception.dart';
import 'package:memoryapp/src/features/memory/application/providers/memo_providers.dart';
import 'package:memoryapp/src/features/memory/domain/memo.dart';
import 'package:memoryapp/src/features/memory/persistance/i_memory_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'set_memo_use_case.g.dart';

class SetMemoUseCase {
  SetMemoUseCase(this.ref);

  final Ref ref;

  Future<void> execute(DateTime dTPickerUser, String textUser) async {
    try {
      final repo = ref.read(memoryRepositoryProvider);
      final datas = ref.read(memoListProvider);

      if (datas.hasValue) {
        final memoList = datas.value!;
        memoList.add(Memo(
            datetime: dTPickerUser,
            textUser: textUser,
            nameRandom: 'nameRandom',
            guess: false));
        await repo.setMemo(memoList);
        ref.read(memoListProvider.notifier).change(memoList);
      }
    } catch (e) {
      throw AppException.unknownError();
    }
  }
}

@riverpod
SetMemoUseCase setMemoUseCase(SetMemoUseCaseRef ref) {
  return SetMemoUseCase(ref);
}
