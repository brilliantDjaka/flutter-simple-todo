import 'package:flutter/material.dart';
import 'package:simple_todo/component/new_todo.dart';
import 'package:simple_todo/component/todo.dart';
import 'package:simple_todo/helpers/command.dart';
import 'package:simple_todo/schema/todo_schema.dart';

import 'helpers/query.dart';

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
  void initState() {
    initTodo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        tooltip: 'delete checked',
        onPressed: () {
          deleteChecked();
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
                addTodo(text);
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

  void addTodo(String text) async {
    TodoScema todo = new TodoScema(checked: false, text: text);
    try {
      var request = await insertTodoApi(todo);
      print(request);
      todo.id = request;
    } catch (_) {
      return;
    }
    setState(() {
      todos.length == null ? todos = [todo] : todos.add(todo);
    });
  }

  void pressTodo(int index) {
    checkUncheck(todos[index]);
    todos[index].checked = !todos[index].checked;
  }

  void deleteChecked() async{
    List todosClone = [...todos];
    for (var todo in todosClone) {
      if (todo.checked) {
        deleteCompleted(todo);
        todos.remove(todo);
      }
    }
    setState(() {
      
    });
  }

  void initTodo() async {
    List<TodoScema> res = await getAllTodo();
    setState(() {
      todos = res;
    });
  }
}
