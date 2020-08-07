import 'package:flutter/material.dart';
import 'package:simple_todo/pages/auth.dart';//TODO implement auth
import 'package:simple_todo/pages/main.dart';

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
      home: MyHomePage(title: 'SimpleTodo',),
    );
  }
}

