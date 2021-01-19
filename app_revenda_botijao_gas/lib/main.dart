import 'package:flutter/material.dart';
import './router.dart' as router;
import 'page/home/home_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Revenda Botijão de Gás',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      home: HomePage(),
    );
  }
}
