class Produto {
  final int id;
  final String nome;
  final double preco;

//Uma boa prática de programação é declarar os atributos da classe como final e
//inicializar no construtor, mas no Dart eu só consigo inicializar assim:

  //Produto(this.id, this.nome, this.preco);

// Ou assim:

  Produto(int id, String nome, double preco)
      : this.id = id,
        this.nome = nome,
        this.preco = preco;

  //O Dart não permite inicialiar conforme abaixo porque no processo interno dele
  //as variaveis finais precisam ser inicializadas junto com a classe e, no caso
  //abaixo isso já ocorreu. Para fazer o inicializador abaixo funcionar as
  //variáveis nao podem ser finais. Isso é diferente muito do Java.

  // Produto(int id, String nome, double preco) {
  //   this.id = id;
  //   this.nome = nome;
  //   this.preco = preco;
  // }
}
