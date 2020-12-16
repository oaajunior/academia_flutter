void main(List<String> args) {
  Pessoa p1 = const Pessoa("Oberdan", 18);
  Pessoa p2 = const Pessoa("Oberdan", 18);
  Pessoa p3 = const Pessoa("Maria", 28);
  Pessoa p4 = const Pessoa("Maria", 28);

  print("p1==p2: ${p1 == p2}");
  print("p2==p3: ${p2 == p3}");
  print("p3==p4: ${p3 == p4}");
}

//O Dart permite que eu declare um construtor como constante (isso se os
//atributos forem final), com isso, se eu criar um objeto de uma classe que
//declare seu construtor como constante eu posso reusar esse mesmo objeto
//caso em algum momento do meu programa eu declare um objeto com os mesmos
//valores de atributos. Acima temos exemplos.
class Pessoa {
  final String nome;
  final int idade;
  const Pessoa(this.nome, this.idade);
}
