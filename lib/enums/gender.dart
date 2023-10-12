import 'package:imccalculator/exceptions/invalid_person_field_exception.dart';

enum Gender {
  male(letter: "M", name: "Masculino"),
  female(letter: "F", name: "Feminino"),
  nonBinary(letter: "NB", name: "Não-binário");

  const Gender({required this.letter, required this.name});

  final String letter;
  final String name;

  static Gender parse(String letter) {
    for (final gender in Gender.values) {
      if (letter == gender.letter) {
        return gender;
      }
    }
    throw InvalidBaseTypeException(
        "Letter [$letter] doesn't convert to the expected gender");
  }
}
