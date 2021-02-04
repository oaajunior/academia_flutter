import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:todo_list/app/repositories/todos_repository.dart';

class NewTasksController extends ChangeNotifier {
  final TodosRepository repository;
  final _dateFormat = DateFormat('dd/MM/yyyy');
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameTaskController = TextEditingController();
  DateTime daySelected;
  bool saved = false;
  bool loading = false;
  String error;

  NewTasksController({@required this.repository, String day}) {
    daySelected = _dateFormat.parse(day);
  }

  String get dayFormatted => _dateFormat.format(daySelected);

  Future<void> save() async {
    try {
      if (formKey.currentState.validate()) {
        loading = true;
        saved = false;
        await repository.saveTodo(daySelected, nameTaskController.text);
        loading = false;
        saved = true;
      }
    } catch (e) {
      print(e);
      error = 'Erro ao salvar a task';
    }

    notifyListeners();
  }
}
