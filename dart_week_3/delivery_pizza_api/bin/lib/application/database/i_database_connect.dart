import 'package:mysql1/mysql1.dart';

//Interface para criar uma conexão com o banco de dados.

abstract class IDatabaseConnect {
  Future<MySqlConnection> openConnection();
}
