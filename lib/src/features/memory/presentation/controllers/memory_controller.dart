import 'package:memoryapp/src/features/memory/application/use_cases/set_memo_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'memory_controller.g.dart';

@riverpod
class MemoController extends _$MemoController {
  @override
  FutureOr<void> build() {}

  FutureOr<void> setMemo(DateTime dTPickerUser, String textUser) async {
    final useCase = ref.read(setMemoUseCaseProvider);
    print('dTPicker memo controller ${dTPickerUser.toString()} + ${textUser.toString()} + ${useCase.toString()}');
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => useCase.execute(dTPickerUser, textUser));
  }

  //! TODO Controller pour la tuile de guess d'UI
  // FutureOr<void> guessTime(bool flag, int pos) async {
  //   final useCase = ref.read(toggleGuessUseCaseProvider);
  //   state = const AsyncValue.loading();
  //   state = await AsyncValue.guard(() => useCase.execute(flag, pos));
  // }
}