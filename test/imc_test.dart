import 'package:flutter_test/flutter_test.dart';
import 'package:imccalculator/calc/calc_imc.dart';
import 'package:imccalculator/entity/person.dart';
import 'package:imccalculator/enums/gender.dart';
import 'package:imccalculator/enums/imc_level.dart';
import 'package:imccalculator/exceptions/invalid_imc_level_exception.dart';

void main() {
  group('basic imc testing', () {
    test("get imc value", () {
      final value = CalcIMC.imc(80, 1.80);
      expect(value, equals(24.691358024691358));
    });

    test("get imc level", () {
      const value = 24.691358024691358;
      final level = CalcIMC.getLevel(value);
      expect(level, equals(IMCLevel.normal));
    });

    test("throw exception on out of range imc level", () {
      const value = 1200.0;
      expect(() => CalcIMC.getLevel(value),
          throwsA(const TypeMatcher<InvalidIMCLevelException>()));
    });

    test("get IMC level based on weight and height", () {
      final imc = CalcIMC.getIMCLevel(80, 1.80);
      expect(imc, equals((IMCLevel.normal, 24.691358024691358)));
    });
  });

  group('classes testing', () {
    test("check a person's IMC level", () {
      final jose = Person.make(
        "José",
        "da Silva",
        33,
        1.80,
        80,
        Gender.male,
      );

      final imc = (jose.imcLevel, jose.imcValue);
      expect(imc, equals((IMCLevel.normal, 24.691358024691358)));
    });

    test("check a person's IMC level (strings)", () {
      final jose = Person.makeFromString(
        "José",
        "da Silva",
        "33",
        "1,80",
        "80.0",
        "M",
      );

      final imc = (jose.imcLevel, jose.imcValue);
      expect(imc, equals((IMCLevel.normal, 24.691358024691358)));
    });
  });
}
