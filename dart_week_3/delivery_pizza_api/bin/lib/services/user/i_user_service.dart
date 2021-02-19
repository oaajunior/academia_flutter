import '../../modules/users/view_model/register_input_model.dart';

abstract class IUserService {
  Future<void> register(RegisterInputModel inputModel);
}
