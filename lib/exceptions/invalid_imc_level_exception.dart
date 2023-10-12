class InvalidIMCLevelException implements Exception {
  String msg;
  double value;
  InvalidIMCLevelException(this.msg, this.value);
}
