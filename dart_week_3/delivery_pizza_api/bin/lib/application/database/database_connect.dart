import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';

import '../config/database_connection_configuration.dart';
import 'i_database_connect.dart';

//Para realizar a injeção de dependência com o get_it
//com a ajuda do injectable, basta utilizar a anotação @Injectable(), dentro
//da anotação é utilizada o 'as' porque se trata de uma interface.
@lazySingleton
class DatabaseConnect implements IDatabaseConnect {
  final DatabaseConnectionConfiguration _configuration;
  DatabaseConnect(
    this._configuration,
  );

  //Metodo que cria uma conexão com o banco de dados.

  @override
  Future<MySqlConnection> openConnection() {
    return MySqlConnection.connect(ConnectionSettings(
      host: _configuration.host,
      port: int.parse(_configuration.port),
      user: _configuration.user,
      password: _configuration.password,
      db: _configuration.databaseName,
    ));
  }
}
