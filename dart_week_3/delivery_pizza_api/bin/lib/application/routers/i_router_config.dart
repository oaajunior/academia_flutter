import 'package:shelf_router/shelf_router.dart';

//Interface criada para representar as rotas cadastradas e permitidas
//no servidor criado.
abstract class IRouterConfig {
  void configure(Router router);
}
