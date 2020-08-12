import 'package:flutter/widgets.dart';
import 'package:simple_todo/schema/todo_schema.dart';

class TodoState with ChangeNotifier {
  String _text;
  bool _isCheck = false;
  String id;
  
  TodoState(this._text);
  TodoState.fromScema(TodoScema schema){
    _text = schema.text;
    id = schema.id;
    _isCheck = isCheck;
  }

  get text => _text;
  get isCheck => _isCheck;
  
  void onCheck(){
    _isCheck = !_isCheck;
    notifyListeners();
  }
  TodoScema toTodoSchema() => TodoScema(
    checked: _isCheck,
    text: _text,
    id: id
  );



}