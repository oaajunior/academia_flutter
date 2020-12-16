import 'dart:async';

//O stream é como se fosse um cano, onde eu ternho a parte da entrada e saída.
//Todo valor que for colocado na entrada vai sair no final do cano.
void main(List<String> args) {
  var streamController = StreamController();
  var portaEntrada = streamController.sink;
  var portaSaida = streamController.stream;

  portaEntrada.add(1);
  portaEntrada.add(2);
  portaEntrada.add(3);
  portaEntrada.add(4);
  portaEntrada.add(5);
  portaEntrada.add(6);
  portaEntrada.add(7);

  portaSaida.listen((valor) {
    return print('O valor é: $valor');
  });
  portaSaida.skip(2).where((valor) => valor % 2 == 0).listen((valor) {
    print('O valor é: $valor');
  });
}
