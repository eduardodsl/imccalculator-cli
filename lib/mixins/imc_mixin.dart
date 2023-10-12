import '../base_types.dart';
import '../calc/calc_imc.dart';
import '../enums/imc_level.dart';

/// Adds to a class IMC (Índice de Massa Corporal, in Portuguese) calculation capabilities
mixin IMCMixin {
  late Weight weight;
  late Height height;

  (IMCLevel, double)? _imc;

  void setIMC() {
    _imc = CalcIMC.getIMCLevel(weight.value, height.value);
  }

  void _checkIMC() {
    if (_imc == null) {
      setIMC();
    }
  }

  IMCLevel get imcLevel {
    _checkIMC();
    return _imc!.$1;
  }

  double get imcValue {
    _checkIMC();
    return _imc!.$2;
  }
}
