import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tarefa_traker/model/To_do.dart';
import 'package:tarefa_traker/repository/Todo_List.dart';

class AddTodoList extends StatelessWidget {
  //TextEditingController que notifica o valueNotifier
  final titleController = TextEditingController();
  final descritionController = TextEditingController();

  late Todo todo;

  @override
  Widget build(BuildContext context) {
    //Este provider apenas consegue mostrar os dados porque as funções que ele chama , tem listerns
    final todoprovider = Provider.of<TodoList>(context);

    void gerar() {
      if (titleController.text != "" && descritionController.text != "") {
        todo = Todo(
            title: titleController.text, create: descritionController.text);

        todoprovider.addNewTodo(todo);

        titleController.text = "";
        descritionController.text = "";
        Navigator.pop(context, '/');
      } else {
        Fluttertoast.showToast(
            msg: "Empaty value", toastLength: Toast.LENGTH_LONG, fontSize: 16);
      }
    }

    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.amber,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                child: Image.asset("image/todo1.png"),
              ),
              Divider(
                endIndent: 1,
              ),
              Container(
                child: const Text(
                  "Add new To do",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                endIndent: 1,
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    const Text(
                      "Title :",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      controller: titleController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Descrition",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      controller: descritionController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          gerar();
                        },
                        child: const Text("Guardar"))
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
