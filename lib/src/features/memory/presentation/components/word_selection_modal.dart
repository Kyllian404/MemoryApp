import 'package:flutter/material.dart';

class WordSelectionModal extends StatelessWidget {
  WordSelectionModal({super.key, required this.selectDateTime});

  final _textFieldController = TextEditingController();
  final DateTime selectDateTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      const Text('SELECT YOUR WORD'),
      ElevatedButton(
        child: Text('Bouton Supplémentaire'), // Le texte du bouton
        onPressed: () {
          // Logique du bouton supplémentaire
          print('Bouton Supplémentaire Appuyé');
        },
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _textFieldController,
          decoration:
              const InputDecoration(hintText: "Tapez  quelque chose..."),
        ),
      ),
      ButtonBar(
        children: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              selectDateTime;
            },
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              print(_textFieldController.text);
              // ! Callback changement de contenu
              
            },
            child: const Text('OK'),
          ),
        ],
      )
    ],

    );
  }
}