void main(List<String> args) {
  var pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Masculino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  print("\nRespostas do desafio Dart Intermediário.\n");

  print(
      " 1 - Remover os elementos duplicados (Observação: Levando em consideração "
      "todos os dados das pessoas).\n");

  Set<String> pessoasDuplicadas = {};
  for (var i = 0; i < pessoas.length - 1; i++) {
    for (var j = i + 1; j < pessoas.length; j++) {
      if (pessoas[i].trim() == pessoas[j].trim()) {
        pessoasDuplicadas.add(pessoas[i]);
      }
    }
  }
  print("Elementos duplicados\n");
  print("$pessoasDuplicadas\n");
  print("Lista sem duplicidade\n");
  pessoas = pessoas.toSet().union(pessoasDuplicadas).toList();
  print("$pessoas\n");

  print("2 - Me mostre a quantidade de pessoas do sexo Masculino e Feminino\n");

  int qtdMasculino = 0;
  int qtdFeminino = 0;
  pessoas.forEach((pessoa) {
    var dadosPessoa = pessoa.split("|");

    if (dadosPessoa[2].toLowerCase() == "masculino") {
      qtdMasculino++;
    } else {
      qtdFeminino++;
    }
  });

  print("A quantidade de pessoas do sexo masculino é: $qtdMasculino.");
  print("A quantidade de pessoas do sexo feminino é: $qtdFeminino.\n");

  print("3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos "
      "e mostre a quantidade de pessoas com mais de 18 anos.\n");

  pessoas.removeWhere((pessoa) {
    var dadosPessoa = pessoa.split("|");
    return ((int.tryParse(dadosPessoa[1]) ?? 0) <= 18);
  });

  print("As pessoas com mais de 18 anos são: \n");
  String nomesPessoas = "";
  pessoas.forEach((pessoa) {
    var dadosPessoa = pessoa.split("|");
    nomesPessoas += "${dadosPessoa[0]}, ";
  });
  print("${nomesPessoas.replaceFirst(",", ".", (nomesPessoas.length - 2))}\n");

  print("A quantidade de pessoas com mais de 18 anos é: ${pessoas.length}\n");

  print("4 - Encontre a pessoa mais velha.\n");

  String pessoaMaisVelha = "";
  int idadeComparada = 0;
  int idadeFinal = 0;
  for (var i = 0; i < pessoas.length; i++) {
    var dadosPessoa = pessoas[i].split("|");
    idadeComparada = int.tryParse(dadosPessoa[1]) ?? 0;
    if (i == 0) {
      idadeFinal = idadeComparada;
      pessoaMaisVelha = dadosPessoa[0];
    }
    if (idadeFinal < idadeComparada) {
      idadeFinal = idadeComparada;
      pessoaMaisVelha = dadosPessoa[0];
    }
  }
  print("A pessoa mais velha é: $pessoaMaisVelha");
}
