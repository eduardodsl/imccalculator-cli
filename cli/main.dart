import "dart:io";

import "package:imccalculator/base_types.dart";
import "package:imccalculator/dto/person_dto.dart";
import "package:imccalculator/entity/person.dart";
import "package:imccalculator/enums/gender.dart";
import "package:imccalculator/exceptions/invalid_imc_level_exception.dart";
import "package:imccalculator/exceptions/invalid_person_field_exception.dart";

/// Shows [text], reads line and validates the value before passing to
/// a [callback] function. Exceptions of type `InvalidBaseTypeException` will
/// make the validation fail and repeat the prompt
void getData(final String text, final Function(String) callback) {
  final data = readLine(text);
  if (data == "") {
    stdout.write("Erro: campo não pode estar vazio\n");
    getData(text, callback);
    return;
  }
  try {
    callback(data);
    return;
  } on InvalidBaseTypeException catch (e) {
    stdout.write("Erro: ${e.msg}\n");
    getData(text, callback);
  }
}

/// shows [text] and returns the data read from the line
String readLine(String text) {
  stdout.write(text);
  return stdin.readLineSync() ?? "";
}

/// takes a [person] object and prints their result data
void printResults(Person person) {
  final resultText = "\n\n==========[RESULTADO]==========\n\n"
      "${person.name} ${person.surname}, gênero ${person.gender.name}.\n"
      "Tem ${person.height.value} metros de altura, pesando ${person.weight.value} quilos, "
      "${person.age.value} anos de idade.\nPossui um índice de massa corporal (IMC) de "
      "${person.imcValue}, considerado ${person.imcLevel.name}.\n\n";
  stdout.write(resultText);
}

void main() {
  stdout.write("==========[CALCULADORA DE IMC]==========\n");
  stdout.write("Por Eduardo Augusto da Silva Leite\n\n");

  final personDTO = PersonDTO();

  getData("Digite seu [nome]...........: ", (data) => personDTO.name = data);
  getData("Digite seu [sobrenome]......: ", (data) => personDTO.surname = data);
  getData("Digite sua [idade]..........: ",
      (data) => personDTO.age = Age.parse(data));
  getData("Digite sua [altura].........: ",
      (data) => personDTO.height = Height.parse(data));
  getData("Digite seu [peso]...........: ",
      (data) => personDTO.weight = Weight.parse(data));
  getData("Digite seu [sexo (M/F/NB)]..: ",
      (data) => personDTO.gender = Gender.parse(data));

  try {
    final person = Person.makeFromDTO(personDTO);
    printResults(person);
  } on InvalidIMCLevelException catch (e) {
    stdout.write(e.msg);
  }
}
