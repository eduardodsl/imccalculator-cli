import 'package:imccalculator/calc/convert.dart';
import 'package:imccalculator/exceptions/invalid_person_field_exception.dart';

abstract class BaseType<T> {
  final T value;
  BaseType(this.value);
  void validate();
}

class Weight implements BaseType<double> {
  @override
  final double value;
  Weight(this.value) {
    validate();
  }
  static Weight parse(String value) {
    try {
      return Weight(Convert.parseDouble(value));
    } on FormatException {
      throw InvalidHeightException(
          "Peso [$value] não possui um formato válido");
    }
  }

  @override
  void validate() {
    if (value < 0) {
      throw InvalidWeightException("Peso possui um valor negativo");
    }
  }
}

class Height implements BaseType<double> {
  @override
  final double value;
  Height(this.value) {
    validate();
  }
  static Height parse(String value) {
    try {
      return Height(Convert.parseDouble(value));
    } on FormatException {
      throw InvalidHeightException(
          "Altura [$value] não possui um formato válido");
    }
  }

  @override
  void validate() {
    if (value < 0) {
      throw InvalidHeightException("Altura possui um valor negativo");
    }
  }
}

class Age implements BaseType<int> {
  @override
  final int value;
  Age(this.value) {
    validate();
  }
  static Age parse(String value) {
    try {
      return Age(int.parse(value));
    } on FormatException {
      throw InvalidAgeException("Formato para a idade não é válido");
    }
  }

  @override
  validate() {
    if (value < 0) {
      throw InvalidAgeException("Idade [$value] possui um valor negativo");
    }
  }
}
