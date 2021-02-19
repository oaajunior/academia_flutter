import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'service_locator_config.config.dart';

final getIt = GetIt.instance;

//Essa anotação é criada para inicializar o injectable, os dados abaixo é um
//padrão que pode ser conseguido diretamente na página do package em pub.dev.
@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
//Faz a inicialização do get_it junto com o injectable.
void configureDependencies() => $initGetIt(getIt);
