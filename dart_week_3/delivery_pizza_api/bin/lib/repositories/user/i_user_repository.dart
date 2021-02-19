import '../../modules/users/view_model/register_input_model.dart';

abstract class IUserRepository {
  Future<void> saveUser(RegisterInputModel model);
}
