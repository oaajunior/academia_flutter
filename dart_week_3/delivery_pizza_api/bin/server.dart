import 'dart:io';

import 'package:args/args.dart';
import 'package:get_it/get_it.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:dotenv/dotenv.dart' show env, load;
import 'package:shelf_router/shelf_router.dart';

import 'lib/application/config/database_connection_configuration.dart';
import 'lib/application/config/middlewares/middlewares.dart';
import 'lib/application/config/service_locator_config.dart';
import 'lib/application/routers/router_config.dart';

// For Google Cloud Run, set _hostname to '0.0.0.0'.
const _hostname = 'localhost';

//Este é o principal arquivo de um servidor shelf.
void main(List<String> args) async {
  var parser = ArgParser()..addOption('port', abbr: 'p');
  var result = parser.parse(args);

  // For Google Cloud Run, we respect the PORT environment variable
  var portStr = result['port'] ?? Platform.environment['PORT'] ?? '8080';
  var port = int.tryParse(portStr);

  if (port == null) {
    stdout.writeln('Could not parse port value "$portStr" into a number.');
    // 64: command line usage error
    exitCode = 64;
    return;
  }

//Função para colocar no ar o GetIT e carregar as variáveis do ambiente de desen-
//volvimento através do arquivo .env

  await loadConfigApplication();

  //Criação de rotas com o shelf_router
  final appRouter = Router();

  //Classe e método criados para adicionar todas as rotas na instancia do Router() criada.
  RouterConfig(appRouter).configure();

  var handler = const shelf.Pipeline()
      .addMiddleware(
          shelf.logRequests()) //Middleware para registrar o log do shelf
      .addMiddleware(
          cors()) //Middleware para configurar algumas informações do que
      //é permitido ser requisitado através do header. Como por exemplo, que
      //verbos http estão habilitados. Dúvidas, acessar a função
      //cors().
      .addMiddleware(defaultResponseContentType(
          'application/json;charset=utf-8')) //Middleware criado para informar
      //qual é content-type default
      //da aplicação.
      .addHandler(appRouter); //No Handler, passamos o instância da rota criada.

  var server = await io.serve(handler, _hostname, port);
  print('Serving at http://${server.address.host}:${server.port}');
}

// shelf.Response _echoRequest(shelf.Request request) =>
//     shelf.Response.ok('Request for "${request.url}"');

//Dentro dessa função é chamada a funcão load() que carrega todos os dados
//do arquivo .env e disponibiliza um mapa contendo chave:valor.
//Foi criada a classe DataBaseConnectionConfiguration para se ter
//uma instancia com esses dados do arquivo .env  . Os dados de produção ficará
//armanezado nesse Platform.enviroment para garantir segurança no acesso aos
//dados, porém, se não for setado dados do servidor, será usada as variáveis
//do ambiente de desenvolvimento que é representada aqui com as informações
//do arquivo .env  . No final, é solicitado que o GetIt.I.registerSiingleton()
//registre a instância como um singleton para a injeção de dependência.
//A função configureDependencies() é utilizada para inicializar o
//injectable. Dúvida consultar a função.

Future<void> loadConfigApplication() async {
  await load();
  final databaseConfig = DatabaseConnectionConfiguration(
    host: Platform.environment['DATABASE_HOST'] ?? env['databaseHost'],
    user: Platform.environment['DATABASE_USER'] ?? env['databaseUser'],
    password:
        Platform.environment['DATABASE_PASSWORD'] ?? env['databasePassword'],
    port: Platform.environment['DATABASE_PORT'] ?? env['databasePort'],
    databaseName: Platform.environment['DATABASE_NAME'] ?? env['databaseName'],
  );

  GetIt.I.registerSingleton(databaseConfig);
  configureDependencies();
}
