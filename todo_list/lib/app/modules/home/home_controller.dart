import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';
import 'package:todo_list/app/models/todo_model.dart';

import 'package:todo_list/app/repositories/todos_repository.dart';

class HomeController extends ChangeNotifier {
  final TodosRepository repository;
  int selectedTab = 1;
  DateTime daySelected;
  DateTime startFilter;
  DateTime endFilter;
  Map<String, List<TodoModel>> listTodos;
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  bool deleted = false;
  bool loading = false;
  String error;
  HomeController({
    @required this.repository,
  }) {
    findAllForWeek();
  }

  Future<void> changeSelectedTab(BuildContext context, int indexTab) async {
    selectedTab = indexTab;
    switch (selectedTab) {
      case 0:
        filterFinalized();
        break;
      case 1:
        findAllForWeek();
        break;
      case 2:
        var day = await showDatePicker(
          context: context,
          initialDate: daySelected,
          firstDate: DateTime.now().subtract(Duration(days: 360 * 3)),
          lastDate: DateTime.now().add(Duration(days: 360 * 10)),
        );

        if (day != null) {
          daySelected = day;
          filterBySelectedDay();
        }

        break;
      default:
    }
    notifyListeners();
  }

  Future<void> findAllForWeek() async {
    daySelected = DateTime.now();

    startFilter = DateTime.now();
    if (startFilter.weekday != DateTime.monday) {
      startFilter = startFilter.subtract(
        Duration(days: startFilter.weekday - 1),
      );
    }
    endFilter = startFilter.add(Duration(days: 6));
    var todos = await repository.findByPeriod(startFilter, endFilter);

    if (todos.isEmpty) {
      listTodos = {dateFormat.format(DateTime.now()): []};
    } else {
      listTodos =
          groupBy(todos, (TodoModel todo) => dateFormat.format(todo.dataHora));
    }
    notifyListeners();
  }

  void checkedOrUnchecked(TodoModel todo) {
    todo.finalizado = !todo.finalizado;
    notifyListeners();
    repository.checkOrUncheckTodo(todo);
  }

  void filterFinalized() {
    listTodos = listTodos.map((key, value) {
      var todosFinalized = value.where((t) => t.finalizado).toList();
      return MapEntry(key, todosFinalized);
    });
    notifyListeners();
  }

  Future<void> filterBySelectedDay() async {
    var todos = await repository.findByPeriod(daySelected, daySelected);

    if (todos.isEmpty) {
      listTodos = {dateFormat.format(daySelected): []};
    } else {
      listTodos =
          groupBy(todos, (TodoModel todo) => dateFormat.format(todo.dataHora));
    }
    notifyListeners();
  }

  void update() {
    if (selectedTab == 1) {
      this.findAllForWeek();
    } else if (selectedTab == 2) {
      this.filterBySelectedDay();
    } else {
      this.filterFinalized();
    }
  }

  Future<void> deleteTask(taskId) async {
    try {
      loading = true;
      deleted = false;
      await repository.removeTodo(taskId);
      listTodos.forEach((key, value) {
        value.removeWhere((item) => item.id == taskId);
      });
      loading = false;
      deleted = true;
      update();
    } catch (e) {
      print(e);
      error = 'Erro ao deletar a task';
    }
  }
}
