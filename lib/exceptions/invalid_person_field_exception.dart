class InvalidBaseTypeException implements Exception {
  String msg;
  InvalidBaseTypeException(this.msg);
}

class InvalidAgeException extends InvalidBaseTypeException {
  InvalidAgeException(super.msg);
}

class InvalidHeightException extends InvalidBaseTypeException {
  InvalidHeightException(super.msg);
}

class InvalidWeightException extends InvalidBaseTypeException {
  InvalidWeightException(super.msg);
}

class InvalidGenderException extends InvalidBaseTypeException {
  InvalidGenderException(super.msg);
}
