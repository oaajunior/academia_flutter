//import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';

import '../../application/database/i_database_connect.dart';
import '../../application/exceptions/database_error_exception.dart';
import '../../modules/users/view_model/register_input_model.dart';
import 'i_user_repository.dart';

//@LazySingleton(as: IUserRepository)
class UserRepository implements IUserRepository {
  final IDatabaseConnect _connection;
  UserRepository(
    this._connection,
  );

  @override
  Future<void> saveUser(RegisterInputModel model) async {
    final conn = await _connection.openConnection();
    try {
      await conn.query(
          'INSERT INTO usuario(nome, email, password) VALUES (?, ?, ?)',
          [model.name, model.email, model.password]);
    } on MySqlException catch (e) {
      print(e);
      throw DatabaseErrorException(message: 'Erro ao registrar usuário');
    } finally {
      await conn?.close();
    }
  }
}
