import 'package:desafio_dart_avancado/model/cidade_model.dart';
import 'package:desafio_dart_avancado/model/estado_model.dart';
import 'package:desafio_dart_avancado/service/ibge_api_service.dart';
import 'package:mysql1/mysql1.dart';

class Repository {
  final _ibgeServices = IBGEApiServiceImpl();

  Future<MySqlConnection> getDBConnection() async {
    var settings = ConnectionSettings(
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: 'root',
        db: 'desafio_dart_avancado');

    try {
      var connection = await MySqlConnection.connect(settings);
      return connection;
    } on MySqlException catch (mysqlException) {
      throw Exception(
          '''Houve uma exceção ao tentar se conectar ao banco mysql. \n
                      Código da exceção: ${mysqlException.errorNumber ?? 'não detectado'}\n
                      Exceção: ${mysqlException.message ?? ''}. ''');
    } on MySqlClientError catch (mysqlClientError) {
      throw Exception(
          '''Houve um client error ao tentar se conectar ao banco mysql. \n
                     Erro: ${mysqlClientError.message ?? ''}. ''');
    } catch (error) {
      throw Exception(
          '''Houve um erro inesperado ao tentar se conectar ao banco mysql.\n
                      Código do erro: ${error.errorNumber ?? 'não detectado'}\n
                      Erro: ${error.message ?? ''}. ''');
    }
  }

  Future<String> cadastrarEstadosECidadesNoBanco() async {
    MySqlConnection conn;
    List<EstadoModel> listEstados;
    List<CidadeModel> listCidades;
    try {
      conn = await getDBConnection();
      listEstados = await _ibgeServices.getEstados();
      await Future.forEach(listEstados, (estado) async {
        await conn.query(
            'INSERT INTO estados (id, sigla, nome) VALUES (?, ?, ?) ',
            [estado.id, estado.sigla, estado.nome]);
        listCidades = await _ibgeServices.getCidades(estado.id);
        await Future.forEach(listCidades, (cidade) async {
          await conn.query(
              'INSERT INTO cidades (id, nome, estado, estado_id) VALUES (?, ?, ?, ?) ',
              [cidade.id, cidade.nome, cidade.estado.sigla, cidade.estado.id]);
        });
      });
      return 'Estados e Cidades cadastrados com sucesso!';
    } catch (_) {
      rethrow;
    } finally {
      await conn.close();
    }
  }

  Future<String> getTotalEstadosECidadesCadastradas() async {
    MySqlConnection conn;
    try {
      conn = await getDBConnection();
      var numeroEstados = await conn.query('SELECT COUNT(*) FROM estados');
      var numeroCidades = await conn.query('SELECT COUNT(*) FROM cidades');
      return 'O total de estados é ${numeroEstados.first[0]}, e o total de cidades é: ${numeroCidades.first[0]}';
    } catch (error) {
      throw Exception(
          '''Houve um erro ao tentar pegar o total de cidades e estados \n
              Exceção: ${error.toString()}''');
    } finally {
      await conn.close();
    }
  }
}
