void main(List<String> args) {
  comprimentar("Oberdan", (mensagem) {
    print(mensagem);
  });

  despedir("Oberdan", (mensagem) {
    print(mensagem);
  });
}

void comprimentar(String nome, void Function(String mensagem) callback) {
  callback("Olá $nome, seja bem-vindo!");
}

//Com os typedefs eu posso declarar uma função de callback e chamá-la em
//qualquer parte do meu código.

typedef CallbackMessage = void Function(String mensagem);

void despedir(String nome, CallbackMessage callback) {
  callback("Obrigado pela visita, $nome!");
}
