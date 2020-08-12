import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/component/new_todo.dart';
import 'package:simple_todo/component/todo.dart';
import 'package:simple_todo/states/todo.dart';
import 'package:simple_todo/states/todos.dart';

class TodoPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AllTodoState allTodo = Provider.of<AllTodoState>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo Page'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.delete),
          onPressed: (){
            allTodo.removeCompleted();
            
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
                                oncheck: () => todo.onCheck(),
                              ),
                            ))),
              ),
            ),
            NewTodo(
              callback: (text) {
                allTodo.addTodo(text);
              },
            )
          ],
        ));
  }
}
