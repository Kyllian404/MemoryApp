import 'package:memoryapp/src/features/memory/application/use_cases/delete_challenge_list_use_case.dart';
import 'package:memoryapp/src/features/memory/application/use_cases/remove_memo_challenge_list_use_case.dart';
import 'package:memoryapp/src/features/memory/application/use_cases/set_memo_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'memory_controller.g.dart';

@riverpod
class MemoController extends _$MemoController {
  @override
  FutureOr<void> build() {}

  /// Pour ajouter un memo à la challengelist
  FutureOr<void> setMemo(DateTime dTPickerUser, String textUser) async {
    final useCase = ref.read(setMemoUseCaseProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => useCase.execute(dTPickerUser, textUser));
  }

  /// Pour retirer un memo de la challengelist
  Future<void> cleanGuess(int positionId) async {
    final repo = ref.read(removeMemoChallengeListUseCaseProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => repo.execute(positionId));
  }

  /// Pour vider la challengelist
  Future<void> cleanChallenge() async {
    final repo = ref.read(deleteChallengListUseCaseProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => repo.execute());
  }
}
