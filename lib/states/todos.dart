import 'package:flutter/widgets.dart';
import 'package:simple_todo/states/todo.dart';

class AllTodoState with ChangeNotifier {
  List<TodoState> _todos = [];
  AllTodoState();
  AllTodoState.fromList(List<TodoState> todos) {
    _todos = todos;
  }
  List<TodoState> get todos => _todos;
  set setTodos(List<TodoState> todos) {
    _todos = todos;
    notifyListeners();
  }

  void addTodo(String todo, String id) {
    _todos.add(TodoState(todo, id));
    notifyListeners();
  }

  void removeCompleted() {
    _todos.removeWhere((element) => element.isCheck);
    notifyListeners();
  }
}
