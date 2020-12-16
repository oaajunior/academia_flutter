//Essa declaracao é só para lembrar que no Dart nao tenho a keyword interface
//para declarar uma interface, uma interface é nada mais é do que uma classe
//abstrata com todos os campos e metodos abstratos.
abstract class Mamifero {
  late String especie;
  late String patas;

  void comer(String alimento);
}
