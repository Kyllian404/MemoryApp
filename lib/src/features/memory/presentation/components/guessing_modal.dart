// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoryapp/src/features/memory/presentation/controllers/memory_controller.dart';

class GuessingModal extends ConsumerStatefulWidget {
  const GuessingModal({
    super.key,
    required this.parentContext,
    required this.callback,
    required this.wordUser,
    required this.idItemList,
  });

  final BuildContext parentContext;
  final void Function(BuildContext) callback;
  final String wordUser;
  final int idItemList;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GuessingModalState();
}

class _GuessingModalState extends ConsumerState<GuessingModal> {
  final _userInputController = TextEditingController();

  @override
  void dispose() {
    _userInputController.dispose();
    super.dispose();
  }

  void _handleUserGuess() async {
    if (_userInputController.text.trim().toLowerCase() ==
        widget.wordUser.trim().toLowerCase()) {
      _showResultModal(context: widget.parentContext, isSuccess: true);
    } else {
      _showResultModal(context: widget.parentContext, isSuccess: false);
    }
  }

  void _showResultModal(
      {required BuildContext context, required bool isSuccess}) {
    final resultMessage = isSuccess
        ? "Félicitations! Le mot était : ${widget.wordUser} + ${widget.idItemList}"
        : "Encouragements! Essayez encore. Le mot était : ${widget.wordUser}";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isSuccess ? "Félicitations" : "Encouragements"),
          content: Text(resultMessage),
          actions: <Widget>[
            TextButton(
              child: const Text("Fermer"),
              onPressed: () async {
                final controller = ref.read(memoControllerProvider.notifier);
                final state = ref.watch(memoControllerProvider);
                if (!state.isLoading) {
                  await controller.cleanGuess(widget.idItemList);
                  Navigator.of(context).pop();
                }
                Navigator.of(context).pop(); 
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _userInputController,
              decoration: const InputDecoration(
                hintText: "Devinez le mot...",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _handleUserGuess,
            child: const Text("Soumettre"),
          ),
        ],
      ),
    );
  }
}
