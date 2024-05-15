import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoryapp/src/exceptions/app_exception.dart';
import 'package:memoryapp/src/features/memory/application/providers/memo_providers.dart';
import 'package:memoryapp/src/features/memory/persistance/i_memory_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_challenge_list_use_case.g.dart';

class DeleteChallengListUseCase {
  DeleteChallengListUseCase(this.ref);

  final Ref ref;

  Future<void> execute() async {
    try {
      // Accès au repository
      final repo = ref.read(memoryRepositoryProvider);
      

      // Tentative de suppression de tous les éléments de la liste
      await repo.cleanChallenge();

      // Mise à jour de l'état pour refléter la liste vide
      ref.read(memoListProvider.notifier).change([]);

    } catch (e) {
      throw AppException.unknownError();
    }
  }
}

@riverpod
DeleteChallengListUseCase deleteChallengListUseCase(
    DeleteChallengListUseCaseRef ref) {
  return DeleteChallengListUseCase(ref);
}
