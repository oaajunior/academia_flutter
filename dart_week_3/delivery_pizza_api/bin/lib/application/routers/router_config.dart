// import '../../modules/menu/menu_router.dart';
// import '../../modules/users/users_router.dart';
import 'package:shelf_router/shelf_router.dart';

import './i_router_config.dart';

//classe responsável por pegar todas as rotas informadas e configurar no arquivo
//de rotas declarado no arquivo server.dart
class RouterConfig {
  final Router _router;
  final List<IRouterConfig> routers = [
    // UsersRouter(),
    // MenuRouter(),
  ];

//Construtor que receberá a instancia da rota principal
  RouterConfig(this._router);

//Metodo que vai pegar todas as rotas e configurará na rota principal
//recebida a partir do arquivo server.dart
  void configure() => routers.forEach((r) => r.configure(_router));
}
