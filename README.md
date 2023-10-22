# Calculadora IMC - CLI

Versão de terminal da calculadora de IMC para o desafio DIO.
Ela é baseada em um sistema de "tipos base", onde é criado um tipo para cada atributo da pessoa que são capazes de validar, converter strings para o seu tipo primitivo e lançar exceções caso os valores passados não sejam satisfatórios.

Ao invés de criar uma classe IMC, eu criei um mixin que introduz getters e setters e permite o acesso aos dados de IMC da pessoa guardando o cálculo em memória

Para executar o programa, basta executar o seguinte comando:

`dart cli/main.dart`

Esta mesma estrutura de classes será reutilizada nos projetos futuros.