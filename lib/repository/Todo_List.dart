import 'package:flutter/material.dart';
import 'package:tarefa_traker/model/To_do.dart';

class TodoList extends ChangeNotifier {
  List<Todo> all_todo = [];
  List<Todo> finished = [];

  void addNewTodo(Todo todo) {
    all_todo.add(todo);
    notifyListeners();
  }

  void addFinishedTodo(Todo finishtodo) {
    if (finishtodo.finish == true) {
      finished.add(finishtodo);
    } else {
      print("Adicionar aqui alguma coisa");
    }
    notifyListeners();
  }

  void removeAllFinish() {
    finished = [];
    notifyListeners();
  }

  void deleteTodo() {}
}
