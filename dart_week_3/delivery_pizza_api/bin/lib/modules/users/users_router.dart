// import 'package:get_it/get_it.dart';
// import 'package:shelf_router/src/router.dart';

// import '../../application/routers/i_router_config.dart';
// import 'controller/user_controller.dart';

// //Classe que implementa a interface IRouterConfig
// //que possui o metodo configure(), este método
// //executará o método mout que recebe como parâmetro
// //a rota, e o que será executado quando essa
// //rota for acessada, no caso, isso foi delegado para
// //o UserController().router.
// class UsersRouter implements IRouterConfig {
//   @override
//   void configure(Router router) {
//     final userController = GetIt.I.get<UserController>();
//     router.mount('/user', userController.router);
//   }
// }
