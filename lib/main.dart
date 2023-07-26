import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarefa_traker/repository/Todo_List.dart';
import 'package:tarefa_traker/ui/homepage.dart';

void main() {
  runApp(
      //Adicioar o Provider TodoList em cima de todo os widget da arvore;
      ChangeNotifierProvider(
    create: (context) => TodoList(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage());
  }
}