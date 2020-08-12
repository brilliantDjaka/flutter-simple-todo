import 'package:flutter/widgets.dart';
import 'package:simple_todo/states/todo.dart';

class AllTodoState with ChangeNotifier {
  List<TodoState> _todos = [
    TodoState('tesuto')
  ];
  AllTodoState();
  AllTodoState.fromList(List<TodoState> todos){
    _todos = todos;
  }
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
