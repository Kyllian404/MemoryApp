/// Validator de base
abstract class StringValidator {
  String? validate(String? value);
}

/// Implémentation de validator qui refuse les espaces
class SpaceEscapeValidator implements StringValidator {
  @override
  String? validate(String? value) {
    if (value != null && value.isNotEmpty && value.contains(' ')) {
      return "La saisie ne doit pas contenir d'espaces";
    }
    return null;
  }
}

/// Validator pour les champs de texts de types Pseudonymes
class NameValidator implements StringValidator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "La saisie ne peut pas être vide";
    }
    if (value.length < 3) {
      return "La saisie doit contenir au moins 3 caractères";
    }
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return "La saisie ne peut pas contenir de caractères spéciaux";
    }
    return null;
  }
}