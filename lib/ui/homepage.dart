import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:tarefa_traker/repository/Todo_List.dart';
import 'package:tarefa_traker/ui/detalhe.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  //Criação de componente de widget a parte , que também pode ser utilizado no futuro

  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<TodoList>(context);

    appBarDinamico() {
      if (todo.finished.isEmpty) {
        return AppBar(
          backgroundColor: Color.fromARGB(255, 237, 204, 107),
          title: Center(
            child: const Text(
              "TO DO",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        );
      } else if (todo.finished.isNotEmpty) {
        return AppBar(
          backgroundColor: Color.fromARGB(255, 237, 204, 107),
          title: Center(
            child: const Text(
              "TO DO",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  todo.finished.forEach((e) {
                    e.finish = true;
                  });
                  setState(() {});
                },
                icon: Icon(Icons.check)),
            IconButton(
                onPressed: () {
                  todo.finished.forEach((element) {
                    element.finish = false;
                  });
                  setState(() {});
                },
                icon: Icon(Icons.radio_button_unchecked)),
          ],
        );
      }
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 204, 107),
      appBar: appBarDinamico(),
      body: Center(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                leading: Checkbox(
                  value: todo.all_todo.elementAt(index).finish,
                  onChanged: (value) {
                    setState(() {
                      todo.all_todo.elementAt(index).finish = value;
                      print(todo.all_todo.elementAt(index).finish);
                    });
                  },
                ),
                title: Text(
                  todo.all_todo.elementAt(index).title.toString(),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                selected: todo.finished.contains(todo.all_todo[index]),
                selectedTileColor: Color.fromARGB(255, 79, 102, 80),
                onLongPress: () {
                  if (todo.finished.contains(todo.all_todo[index])) {
                    todo.finished.remove(todo.all_todo[index]);
                  } else {
                    todo.finished.add(todo.all_todo[index]);
                  }
                  setState(() {});
                },
                trailing: IconButton(
                    onPressed: () {
                      todo.deleteTodo(index);
                    },
                    icon: Icon(Icons.delete)),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Detalhe(index: index),
                    ),
                  );
                },
                // trailing:
                //Text(todo.all_todo.elementAt(index).create.toString()),
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: todo.all_todo.length),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            //Navegação por routa parece mais interresante .
            Navigator.pushNamed(context, '/addNewTodo');
          },
          child: Icon(Icons.add)),
    );
  }
}
