import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/component/new_todo.dart';
import 'package:simple_todo/component/todo.dart';
import 'package:simple_todo/states/auth.dart';
import 'package:simple_todo/states/todo.dart';
import 'package:simple_todo/states/todos.dart';
import 'package:simple_todo/helpers/command.dart' as command;
import 'package:simple_todo/component/snackbars.dart' as snackbars;

class TodoPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AllTodoState allTodo = Provider.of<AllTodoState>(context, listen: false);
    var auth = Provider.of<AuthState>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo Page'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.delete),
          onPressed: () async{
            snackbars.onProcess(context);
            try {
              await allTodo.removeCompleted();
              snackbars.success(context);
            } catch (e) {
              snackbars.error(context);
            }
          },
        ),
        body: Column(
          children: [
            Expanded(
              child: Consumer<AllTodoState>(
                builder: (context, allTodo, child) => ListView.builder(
                    itemCount: allTodo.todos.length,
                    itemBuilder: (context, i) =>
                        ChangeNotifierProvider<TodoState>.value(
                            value: allTodo.todos[i],
                            child: Consumer<TodoState>(
                              builder: (context, todo, child) => Todo(
                                checked: todo.isCheck,
                                text: todo.text,
                                oncheck: () async {
                                  snackbars.onProcess(context);
                                  try {
                                    await command.checkUncheck(todo.id);
                                    todo.onCheck();
                                    snackbars.success(context);
                                  } catch (err) {
                                    snackbars.error(context);
                                  }
                                },
                              ),
                            ))),
              ),
            ),
            NewTodo(
              callback: (text) async {
                snackbars.onProcess(context);
                try {
                  var id = await command.insertTodoApi(text, auth.email);
                  allTodo.addTodo(text, id);
                  snackbars.success(context);
                } catch (err) {
                  snackbars.error(context);
                }
              },
            )
          ],
        ));
  }
}
