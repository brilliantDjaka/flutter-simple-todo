import 'package:flutter/material.dart';
import 'package:simple_todo/pages/todo.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/states/todos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>(AllTodoState()))
        ],
        child:Scaffold(body: TodoPages()),
      ),
    );
  }
}

