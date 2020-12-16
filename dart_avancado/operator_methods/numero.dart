class Numero {
  final int i;
  Numero(this.i);

//No Dart eu consigo declarar um operador como um método qualquer, para isso,
// basta usar a keyword operator mais o operador desejado. Aqui um exemplo de
//como usar isso.
  Numero operator +(Numero numero) {
    return Numero(numero.i + i);
  }

  @override
  String toString() {
    return '$i';
  }
}
