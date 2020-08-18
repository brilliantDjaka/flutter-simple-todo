import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/component/new_todo.dart';
import 'package:simple_todo/component/todo.dart';
import 'package:simple_todo/states/auth.dart';
import 'package:simple_todo/states/loading.dart';
import 'package:simple_todo/states/todo.dart';
import 'package:simple_todo/states/todos.dart';
import 'package:simple_todo/helpers/command.dart' as command;
import 'package:simple_todo/helpers/query.dart' as query;
import 'package:simple_todo/component/snackbars.dart' as snackbars;
import 'package:flutter_spinkit/flutter_spinkit.dart' as spinner;

var timer;

class TodoPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AllTodoState allTodo = Provider.of<AllTodoState>(context, listen: false);
    var auth = Provider.of<AuthState>(context);
    var loading = Provider.of<Loading>(context);
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Todo Page'),
              SizedBox(
                width: 90,
                child: Consumer<Loading>(
                    builder: (context, loading, child) => loading.isLoading
                        ? spinner.SpinKitPulse(color: Colors.white)
                        : Container()),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.delete),
          onPressed: () async {
            loading.initLoading();
            allTodo.removeCompleted();
            try {
              await command.deleteCompleted(auth.email);
            } catch (e) {
              snackbars.error(context);
              allTodo.setTodos = await query.getAllTodo(auth.email);
              return;
            }
            loading.completeLoading();
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
                                  loading.initLoading();
                                  todo.onCheck();
                                  try {
                                    await command.checkUncheck(todo.id);
                                  } catch (err) {
                                    print('error');
                                    allTodo.setTodos =
                                        await query.getAllTodo(auth.email);
                                    snackbars.error(context);
                                  }
                                  loading.completeLoading();
                                },
                              ),
                            ))),
              ),
            ),
            NewTodo(
              callback: (text) async {
                loading.initLoading();
                try {
                  var id = await command.insertTodoApi(text, auth.email);
                  allTodo.addTodo(text, id);
                } catch (err) {
                  allTodo.setTodos = await query.getAllTodo(auth.email);
                  snackbars.error(context);
                }
                loading.completeLoading();
              },
            )
          ],
        ));
  }
}
