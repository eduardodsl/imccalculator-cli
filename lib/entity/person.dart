import 'package:imccalculator/dto/person_dto.dart';
import 'package:imccalculator/mixins/imc_mixin.dart';

import '../base_types.dart';
import '../enums/gender.dart';

/// Represents an person in the system
class Person with IMCMixin {
  final String name;
  final String surname;
  final Age age;
  final Height height;
  final Weight weight;
  final Gender gender;

  Person({
    required this.name,
    required this.surname,
    required this.age,
    required this.height,
    required this.weight,
    required this.gender,
  });

  /// Takes a [personDTO] and constructs a Person object, it must not have empty
  /// attributes
  static Person makeFromDTO(PersonDTO personDTO) {
    return Person(
      name: personDTO.getName(),
      surname: personDTO.getSurname(),
      age: personDTO.getAge(),
      height: personDTO.getHeight(),
      weight: personDTO.getWeight(),
      gender: personDTO.getGender(),
    );
  }

  /// Takes String data, parses it to valid types, and constructs a Person object
  static Person makeFromString(String name, String surname, String age,
      String height, String weight, String gender) {
    return Person(
        name: name,
        surname: surname,
        age: Age.parse(age),
        height: Height.parse(height),
        weight: Weight.parse(weight),
        gender: Gender.parse(gender));
  }

  /// Constructs a Person object without using named parameters
  static Person make(String name, String surname, int age, double height,
      double weight, Gender gender) {
    return Person(
        name: name,
        surname: surname,
        age: Age(age),
        height: Height(height),
        weight: Weight(weight),
        gender: gender);
  }
}
