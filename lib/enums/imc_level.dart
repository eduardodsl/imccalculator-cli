enum IMCLevel {
  veryUnderWeight(range: (0, 17), name: "Muito Abaixo do Peso"),
  underWeight(range: (17, 18.5), name: "Abaixo do Peso"),
  normal(range: (18.5, 25), name: "Normal"),
  overWeight(range: (25, 30), name: "Acima do Peso"),
  obesityL1(range: (25, 35), name: "Obesidade"),
  obesityL2(range: (35, 40), name: "Obesidade Severa"),
  obesityL3(range: (40, 100), name: "Obesidade Mórbida"),
  ;

  const IMCLevel({
    required this.range,
    required this.name,
  });

  final (double, double) range;
  final String name;
}
