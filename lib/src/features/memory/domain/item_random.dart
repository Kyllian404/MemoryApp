import 'dart:ffi';

class ItemRandom {
  ItemRandom(
      {required this.idItem,
      required this.nameRandom,
      required this.dateGuess,
      required this.wordToGuess});

  final Int idItem;
  final String nameRandom;
  final String dateGuess;
  final String wordToGuess;
}
