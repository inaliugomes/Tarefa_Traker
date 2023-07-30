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

  void removeAllTodo() {
    all_todo = [];
    notifyListeners();
  }

  void deleteTodo(int index) {
    all_todo.removeAt(index);
    notifyListeners();
  }
}


/*
  O provider funcionar com change notifier e listeners

  Os metodos mais utilizado vai ser :
    ChangeNotifierProvider - criação do provider e adicionar ele no to da arvore
    Provider.of<tipo do provider> -  vai servir para poder instanciar o meu provider e utilizar os seus metoso
    consumer - seria a maneira correcta de consumir os dados do meu provider
    selector - que nos permite escolher que widget devem sofrer a mudança
    Multiprovider -  Permite adicionar mais que 1 provider em cima da arvore de widget
    StreamProvider - vai nos permitir trabalhar com dados assincronas ou seja aqueles dados que ainda não chegaram mas estão a chegar

    A diferença entre consumer e provider.of é que o consumer não precisa que os dados tenha algo tipo de notificação





*/
