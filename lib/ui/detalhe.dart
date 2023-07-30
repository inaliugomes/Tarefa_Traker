import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarefa_traker/repository/Todo_List.dart';

class Detalhe extends StatefulWidget {
  final int index;
  Detalhe({required this.index});

  @override
  State<Detalhe> createState() => _DetalheState();
}

class _DetalheState extends State<Detalhe> {
  final textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<TodoList>(context);
    setState(() {
      textcontroller.text = todo.all_todo.elementAt(widget.index).create;
    });
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 237, 204, 107),
        body: SafeArea(
          child: TextField(
            controller: textcontroller,
            decoration: InputDecoration(border: OutlineInputBorder()),
            expands: true,
            maxLines: null,
            onChanged: (value) {
              todo.all_todo.elementAt(widget.index).create = value;
            },
          ),
        ));
  }
}
