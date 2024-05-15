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
      //final controller = ref.read(memoControllerProvider.notifier);
      print("${widget.idItemList}");
      //await controller.cleanGuess(widget.idItemList);
      //Navigator.of(context).pop();
      print("Popup 2");
      // Utilisateur a correctement deviné
      _showResultModal(context: widget.parentContext, isSuccess: true);
    } else {
      //final controller = ref.read(memoControllerProvider.notifier);
      print("${widget.idItemList}");
      //await controller.cleanGuess(widget.idItemList);
      //Navigator.of(context).pop();
      print("Popup 2");
      // Utilisateur n'a pas correctement deviné
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
                //! Ici je dois envoyer la positionId à mon controller
                print("Popup 3");
                // Ici, nous envoyons la positionId à notre controller
                final controller = ref.read(memoControllerProvider.notifier);
                final state = ref.watch(memoControllerProvider);
                if (!state.isLoading) {
                  await controller.cleanGuess(widget.idItemList);
                  // Fermez la modal après le traitement
                  Navigator.of(context).pop();
                }

                //if(context.mounted){
                Navigator.of(context).pop(); // Ferme la modal de résultat
                // widget.callback(widget.parentContext); // Callback pour notifier le widget parent
                //}
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //final controller = ref.read(memoControllerProvider.notifier);

    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _userInputController,
              decoration: InputDecoration(
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
