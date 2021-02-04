import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/models/todo_model.dart';
import 'package:todo_list/app/modules/home/home_controller.dart';
import 'package:todo_list/app/modules/new_tasks/new_tasks_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeController>(context, listen: false).addListener(() {
        var controller = context.read<HomeController>();
        if (controller.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(controller.error),
          ));
          controller.error = null;
        }
        if (controller.deleted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Todo excluída com sucesso!'),
          ));
          controller.deleted = false;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    Provider.of<HomeController>(context, listen: false).addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (BuildContext context, HomeController controller, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Atividades',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          bottomNavigationBar: FFNavigationBar(
            selectedIndex: controller.selectedTab,
            onSelectTab: (index) =>
                controller.changeSelectedTab(context, index),
            theme: FFNavigationBarTheme(
              itemWidth: 60,
              barHeight: 70,
              barBackgroundColor: Theme.of(context).primaryColor,
              unselectedItemIconColor: Colors.white,
              unselectedItemLabelColor: Colors.white,
              selectedItemBorderColor: Colors.white,
              selectedItemIconColor: Colors.white,
              selectedItemBackgroundColor: Theme.of(context).primaryColor,
              selectedItemLabelColor: Colors.black,
            ),
            items: [
              FFNavigationBarItem(
                iconData: Icons.check_circle,
                label: 'Finalizado',
              ),
              FFNavigationBarItem(
                iconData: Icons.view_week,
                label: 'Semanal',
              ),
              FFNavigationBarItem(
                iconData: Icons.calendar_today,
                label: 'Selecionar Data',
              ),
            ],
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: controller.listTodos?.keys?.length ?? 0,
              itemBuilder: (context, index) {
                var dateFormat = DateFormat('dd/MM/yyyy');
                var listTodos = controller.listTodos;
                var dayKey = listTodos.keys.elementAt(index);
                var day = dayKey;
                var todos = listTodos[dayKey];
                if (todos.isEmpty && controller.selectedTab == 0) {
                  return SizedBox.shrink();
                }

                var today = DateTime.now();
                if (dayKey == dateFormat.format(today)) {
                  day = 'HOJE';
                } else if (dayKey ==
                    dateFormat.format(today.add(Duration(days: 1)))) {
                  day = 'AMANHÃ';
                }
                return Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            day,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.add_circle,
                                color: Theme.of(context).primaryColor,
                                size: 30,
                              ),
                              onPressed: () async {
                                await Navigator.of(context).pushNamed(
                                  NewTasksPage.routerName,
                                  arguments: dayKey,
                                );

                                controller.update();
                              })
                        ],
                      ),
                    ),
                    ListView.builder(
                      itemCount: todos.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        var todo = todos[index];
                        var itemKey = ValueKey(todos[index]);
                        return buildListTile(
                            context, todo, controller, itemKey);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget buildListTile(BuildContext context, TodoModel todo,
      HomeController controller, Key key) {
    return Dismissible(
      background: Container(
        color: Theme.of(context).primaryColor,
        child: Icon(
          Icons.delete,
          color: Colors.black,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(
          right: 16,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      confirmDismiss: (_) async {
        return showDialog(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                content: Text('Tem certeza de que deseja remover a tarefa?'),
                actions: [
                  FlatButton(
                    child: Text(
                      'Não',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => Navigator.of(ctx).pop(false),
                    color: Colors.grey,
                  ),
                  FlatButton(
                    child: Text(
                      'Sim',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => Navigator.of(ctx).pop(true),
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              );
            });
      },
      key: key,
      direction: DismissDirection.endToStart,
      onDismissed: (_) => controller.deleteTask(todo.id),
      child: ListTile(
        leading: Checkbox(
          activeColor: Theme.of(context).primaryColor,
          value: todo.finalizado,
          onChanged: (bool value) => controller.checkedOrUnchecked(todo),
        ),
        title: Text(
          todo.descricao,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            decoration: todo.finalizado ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Text(
          '${todo.dataHora.hour.toString().padLeft(2, '0')}:${todo.dataHora.minute.toString().padLeft(2, '0')}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            decoration: todo.finalizado ? TextDecoration.lineThrough : null,
          ),
        ),
      ),
    );
  }
}
