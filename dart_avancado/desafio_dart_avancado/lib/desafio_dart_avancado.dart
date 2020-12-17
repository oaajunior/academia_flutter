import 'dart:io';

import 'package:desafio_dart_avancado/repository/repository.dart';
import 'package:dio/dio.dart';

void run() async {
  print('###PROGRAMA PARA CADASTRAR ESTADOS E MUNICÍPIOS BRASILEIROS '
      'NO BANCO DE DADOS###\n\n');
  print('Aguarde, realizando o cadastro no banco de dados....\n');

  try {
    var repository = Repository();
    var result = await repository.cadastrarEstadosECidadesNoBanco();
    print('$result\n');
    print(
        'Aguarde, consultando o total de cidades e estados cadastrados no banco....\n');
    result = await repository.getTotalEstadosECidadesCadastradas();
    print('$result\n');
    print('###FIM DO PROGRAMA###');
  } on HttpException catch (httpException) {
    print('${httpException.message} - URL consultada -> ${httpException.uri}');
  } on DioError catch (dioError) {
    print('''Houve erro na consulta na API do IBGE\n
            Requisição realizda:${dioError.request} - \n
            Mensagem: ${dioError.message}''');
  } on Exception catch (exception) {
    print(exception.toString());
  }
}
