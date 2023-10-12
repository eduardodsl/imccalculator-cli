import 'package:imccalculator/exceptions/invalid_imc_level_exception.dart';

import '../enums/imc_level.dart';

/// utility that helps calculate the IMC (índice de massa corporal, in Portuguese)
class CalcIMC {
  /// Calculates IMC by dividing [weight] in kilos
  /// by the square of [height] in meters
  static double imc(double weight, double height) {
    return weight / (height * height);
  }

  /// Returns the level of IMC based on a [imcValue]
  static IMCLevel getLevel(double imcValue) {
    for (final level in IMCLevel.values) {
      if (imcValue > level.range.$1 && imcValue < level.range.$2) {
        return level;
      }
    }
    throw InvalidIMCLevelException(
        "value [$imcValue] is not a valid IMC within range [0-100]", imcValue);
  }

  /// Returns the IMC level and value based on [weight] and [height]
  static (IMCLevel level, double value) getIMCLevel(
      double weight, double height) {
    final imcValue = imc(weight, height);
    return (getLevel(imcValue), imcValue);
  }
}
