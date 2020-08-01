import 'package:flutter/material.dart';
import 'package:simple_todo/component/new_todo.dart';
import 'package:simple_todo/component/todo.dart';
import 'package:simple_todo/schema/todo_schema.dart';

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
      home: MyHomePage(title: 'Simple Todo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TodoScema> todos = <TodoScema>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        tooltip: 'delete checked',
        onPressed: () {
          setState(() {
            deleteChecked();
          });
        },
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ...List.generate(todos == null ? 0 : todos.length, (index) {
              TodoScema currentTodo = todos[index];
              return Todo(
                checked: currentTodo.checked,
                text: currentTodo.text,
                oncheck: () {
                  setState(() {
                    pressTodo(index);
                  });
                },
              );
            }),
            NewTodo(
              callback: (text) {
                setState(() {
                  addTodo(text);
                });
              },
            )
          ],
        ),
      )),
    );
  }

  void deleteTodo(index) {
    todos.removeAt(index);
  }

  void addTodo(String text) {
    TodoScema todo = new TodoScema(checked: false, text: text);
    todos.length == null ? todos = [todo] : todos.add(todo);
  }
  void pressTodo(int index) {
    todos[index].checked = !todos[index].checked;
  }
  void deleteChecked() {
    List todosClone = [...todos];
    for (var todo in todosClone) {
      if(todo.checked) todos.remove(todo);
    }
  }
}
