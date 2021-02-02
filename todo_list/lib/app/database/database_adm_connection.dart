import 'package:flutter/material.dart';

import 'connection.dart';

//Aqui o professor usa essa classe com Mixin com WidgetsBindingObserver
//Para observar o ciclo de vida do aplicativo. Se o aplicativo ficar
//inativo, pausado ou for fechado (detached) a conexão com o banco de
//dados será fechada. Eles explicou que não colocará para abrir a conexão
//no state resumed porque quem for precisar de uma conexão lá na frente
//vai requisitar essa conexão. Não precisando já, de antemão, deixar uma
//aberta.
class DatabaseAdmConnection extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    var connection = Connection();
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        connection.closeConnection();
        break;
      default:
        break;
    }
    super.didChangeAppLifecycleState(state);
  }
}
