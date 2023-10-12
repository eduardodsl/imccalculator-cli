class Convert {
  static double parseDouble(String value) {
    value = value.replaceAll(RegExp(r','), ".");
    return double.parse(value);
  }
}
