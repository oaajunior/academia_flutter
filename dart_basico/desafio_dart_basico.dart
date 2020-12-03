void main(List<String> args) {
  //Lista de pacientes
  var pacientes = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|estudante|MG',
    'Sandra Silva|40|estudante|MG',
    'Regina Verne|35|estudante|MG',
    'João Rahman|55|Jornalista|SP',
  ];

  //"Desafio 1: Apresente a quantidade de pacientes com mais de 20 anos.
  print(
      "Desafio 1: Apresente a quantidade de pacientes com mais de 20 anos.\n");
  int qtdPacientesMaiorDeVinteAnos = 0;
  for (var i = 0; i < pacientes.length; i++) {
    var dadosPaciente = pacientes[i].split("|");
    if ((int.tryParse(dadosPaciente[1]) ?? 0) > 20) {
      qtdPacientesMaiorDeVinteAnos++;
    }
  }

  print("A quantidade de pacientes com mais de vinte anos é: "
      "$qtdPacientesMaiorDeVinteAnos.");

  //Desafio 2: Agrupar os pacientes por familia(considerar o sobrenome) apresentar por familia.
  print(
      "\nDesafio 2: Agrupar os pacientes por familia(considerar o sobrenome) apresentar por familia.\n");

  List<String> nomesOrganizadosPorFamilia = [];
  List<String> dadosPaciente;
  List<String> nomePaciente;

  for (var paciente in pacientes) {
    dadosPaciente = paciente.split("|");
    nomePaciente = dadosPaciente[0].split(" ");
    nomesOrganizadosPorFamilia.add("${nomePaciente[1]} ${nomePaciente[0]}");
  }

  nomesOrganizadosPorFamilia.sort();

  List<String> nomesPorFamilia;
  String familia = "";
  for (var i = 0; i < nomesOrganizadosPorFamilia.length; i++) {
    nomesPorFamilia = nomesOrganizadosPorFamilia[i].split(" ");
    if (i == 0) {
      familia = nomesPorFamilia[i];
      print("\nNomes da Família $familia:");
    }
    if (familia != nomesPorFamilia[0]) {
      familia = nomesPorFamilia[0];
      print("\nNomes da Família $familia:");
    }

    print(nomesPorFamilia[1]);
  }
}
