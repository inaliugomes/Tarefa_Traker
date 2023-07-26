import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tarefa_traker/component/dialog_box.dart';
import 'package:tarefa_traker/repository/Todo_List.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  //Criação de componente de widget a parte , que também pode ser utilizado no futuro
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox();
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<TodoList>(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 204, 107),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 237, 204, 107),
        title: Center(
          child: Text(
            "TO DO",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: Center(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Checkbox(
                  value: todo.all_todo.elementAt(index).finish,
                  onChanged: (value) {
                    // todo.all_todo.elementAt(index).finish = false;
                  },
                ),
                title: Text(todo.all_todo.elementAt(index).title.toString()),
                trailing:
                    Text(todo.all_todo.elementAt(index).create.toString()),
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: todo.all_todo.length),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask, child: Icon(Icons.add)),
    );
  }
}
