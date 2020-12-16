class Pessoa {
  String? nome;
  String? idade;

  //Declaracao de um construtor de forma mais prática já que eu não tenho regras
  //negocios.
  //Pessoa(this.nome, this.idade);

  //Pessoa(this.nome); Não é igual ao Java e ao C# onde se os parametros forem
  //diferentes eu posso criar construtores com o mesmo nome.
  //Precisaria criar um construtor nomeado.
  //Pessoa.soComNome(this.nome);

  //Declaracao do construtor com parametros nomeados/opcionais.
  //Pessoa({this.nome, this.idade});

  //Declaracao do construtor com apenas um dos parametros opcionais.
  //Pessoa(this.nome, [this.idade]);
  //Observacao: Nao posso criar num construtor com parametros nomeados {} e
  //opcionais [] ao mesmo tempo, pois parametros nomeados {} já são opcionais.
}
