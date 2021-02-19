// import 'dart:convert';

// import 'package:injectable/injectable.dart';
// import 'package:shelf/shelf.dart';
// import 'package:shelf_router/shelf_router.dart';

// import '../../../services/user/i_user_service.dart';
// import 'mappers/register_input_model_mapper.dart';

// //Essa classe faz part da classe de nome homonimo (user_controller.g.dart)
// //que será gerada através do comando do pub run build_runner watch
// //é necessário declarar o comando abaixo. em princípio ficara com erro
// //mas logo após executar o build_runner o erro sumirá.
// part 'user_controller.g.dart';

// //Essa classe diz o que será feito quando o usuário acessar a rota
// // \/user\/ então, a partir da raiz de user\/ será executado a
// //função helloWorld que receberá uma requisição e devolverá um
// //json com a chave name e o valor 'Hello World'.

// @injectable
// class UserController {
//   final IUserService _service;

//   UserController(this._service);

//   @Route.post('/')
//   Future<Response> register(Request request) async {
//     try {
//       final requestMap = jsonDecode(await request.readAsString());
//       final inputModel = RegisterInputModelMapper(requestMap).mapper();
//       await _service.register(inputModel);
//       return Response.ok(
//         jsonEncode(
//           {'message': 'Usuario cadastrado com sucesso.'},
//         ),
//       );
//     } catch (e) {
//       print(e);
//       return Response.internalServerError(
//         body: jsonEncode(
//           {'message': 'Erro ao registrar novo usuário.'},
//         ),
//       );
//     }
//   }

// //Essa declaração será utilizada pelo comando pub run build_runner watch
// //é necessário declarar o comando abaixo. Em princípio ficara com erro
// //mas logo após executar o build_runner o erro sumirá.
//   Router get router => _$UserControllerRouter(this);
// }
