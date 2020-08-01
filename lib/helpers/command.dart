import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_todo/schema/todo_schema.dart';

Future<String> insertTodoApi(TodoScema todo) async {
  var data = await http.post(
    'https://trying-out-new-apps.herokuapp.com/todo',
    body: jsonEncode(todo.toMap()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (data.statusCode != 200) {
    throw Error();
  }
  String id = (jsonDecode(data.body))['data']['_id'];
  return id;
}

Future<bool> deleteCompleted(TodoScema todo) async {
  var data = await http.delete(
    'https://trying-out-new-apps.herokuapp.com/todo/${todo.id}',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (data.statusCode != 200) {
    return false;
  }
  return true;
}

Future<bool> checkUncheck(TodoScema todo) async {
  var data = await http.post(
    'https://trying-out-new-apps.herokuapp.com/todo/check/${todo.id}',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (data.statusCode != 200) {
    return false;
  }
  return true;
}