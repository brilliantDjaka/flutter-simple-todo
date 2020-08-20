import 'package:flutter/material.dart';
import 'package:simple_todo/pages/init_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Todo',
      theme: ThemeData(
        accentColor: Color(0xff37d7b2),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: InitPage()
    );
  }
}