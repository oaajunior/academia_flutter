import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:todo_list/app/database/database_adm_connection.dart';
import 'package:todo_list/app/modules/home/home_controller.dart';
import 'package:todo_list/app/modules/home/home_page.dart';
import 'package:todo_list/app/modules/new_tasks/new_tasks_controller.dart';
import 'package:todo_list/app/modules/new_tasks/new_tasks_page.dart';
import 'package:todo_list/app/repositories/todos_repository.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  //Aqui criamos uma instancia da classe DatabaseAdmConnection para
  //acompanhar o status do app.
  DatabaseAdmConnection databaseAdmConnection = DatabaseAdmConnection();

  //No initState() eu registro o observer para ficar de olho no state da
  //minha aplicação.

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(databaseAdmConnection);
    super.initState();
  }

  //E quando a aplicação for fechada eu removo esse observer.
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(databaseAdmConnection);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => TodosRepository(),
        )
      ],
      child: MaterialApp(
        title: 'Todo List',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFFFF9129),
          buttonColor: Color(0xFFFF9129),
          textTheme: GoogleFonts.robotoTextTheme(),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          NewTasksPage.routerName: (_) => ChangeNotifierProvider(
                create: (context) {
                  var day = ModalRoute.of(_).settings.arguments;
                  return NewTasksController(
                      repository: context.read<TodosRepository>(), day: day);
                },
                child: NewTasksPage(),
              ),
        },
        home: ChangeNotifierProvider(
          create: (context) {
            //var repository = Provider.of<TodosRepository>(context, listen: false);
            var repository = context
                .read<TodosRepository>(); //Essa forma de recuperar o repository
            //é equivalente a de cima. É a mesma
            //coisa. Mas só funciona a partir da versao 4.1 do Provider.
            return HomeController(
              repository: repository,
            );
          },
          builder: (context, child) {
            return HomePage();
          },
        ),
      ),
    );
  }
}
