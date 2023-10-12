import '../base_types.dart';
import '../enums/gender.dart';

/// Loosely represents a [Person] object data
class PersonDTO {
  String? name;
  String? surname;
  Age? age;
  Height? height;
  Weight? weight;
  Gender? gender;

  PersonDTO({
    this.name,
    this.surname,
    this.age,
    this.height,
    this.weight,
    this.gender,
  });

  /// Gets the name and asserts it's not null
  String getName() {
    if (name == null) {
      throw Exception("name is null");
    }
    return name ?? "Unknown";
  }

  /// Gets the surname and asserts it's not null
  String getSurname() {
    if (surname == null) {
      throw Exception("surname is null");
    }
    return surname ?? "Unknown";
  }

  /// Gets the age and asserts it's not null
  Age getAge() {
    if (age == null) {
      throw Exception("age is null");
    }
    return age ?? Age(-1);
  }

  /// Gets the height and asserts it's not null
  Height getHeight() {
    if (height == null) {
      throw Exception("age is null");
    }
    return height ?? Height(-1);
  }

  /// Gets the weight and asserts it's not null
  Weight getWeight() {
    if (weight == null) {
      throw Exception("age is null");
    }
    return weight ?? Weight(-1);
  }

  /// Gets the gender and asserts it's not null
  Gender getGender() {
    if (weight == null) {
      throw Exception("gender is null");
    }
    return gender ?? Gender.parse("X");
  }
}
