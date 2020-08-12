import 'package:flutter/widgets.dart';
import 'package:simple_todo/states/todo.dart';

class AllTodoState with ChangeNotifier {
  final List<TodoState> _todos = [
    TodoState('tesuto')
  ];

  List<TodoState> get todos => _todos;

  void addTodo(String todo) {
    _todos.add(
      TodoState(todo)
      );
    notifyListeners();
  }
  void removeCompleted(){
    _todos.removeWhere((element) => element.isCheck);
    notifyListeners();
  }
}
