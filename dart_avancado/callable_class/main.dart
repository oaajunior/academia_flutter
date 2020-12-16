import 'enviar_email.dart';

void main(List<String> args) {
  EnviarEmail enviarEmail = EnviarEmail();
  //Numa callableClass eu posso declar um método chamado call e se eu quiser
  //executar esse método é só executar uma instancia dessa classe que automati-
  //camente ele chama o método conforme exemplo abaixo, ou também poderia chamar
  //o metodo call sem nenhum problema.
  //Se a classe callableClass tiver outros métodos, esses devem ser executados
  //normalmente.
  print(enviarEmail("oaajunior@gmail.com"));
  print(enviarEmail.getDominio());
}
