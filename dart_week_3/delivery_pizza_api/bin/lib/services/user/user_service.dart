//import 'package:injectable/injectable.dart';

import '../../application/helpers/cripty_helper.dart';
import '../../modules/users/view_model/register_input_model.dart';
import '../../repositories/user/i_user_repository.dart';

import 'i_user_service.dart';

//@LazySingleton(as: IUserService)
class UserService implements IUserService {
  final IUserRepository _repository;

  UserService(this._repository);

  @override
  Future<void> register(RegisterInputModel inputModel) async {
    final passwordCrypt = CriptyHelper.generateSHA256Hash(inputModel.password);
    inputModel.password = passwordCrypt;
    await _repository.saveUser(inputModel);
  }
}
