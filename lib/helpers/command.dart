import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:simple_todo/states/todo.dart';



Future<String> insertTodoApi(String text,String email) async {
  var data = await http.post(
    'https://trying-out-new-apps.herokuapp.com/todo',
    body: jsonEncode({"text": text, 
    "isChecked": false, 
    "author": email}),
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

Future<void> deleteCompleted(TodoState todo) async {
  var data = await http.delete(
    'https://trying-out-new-apps.herokuapp.com/todo/${todo.id}',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (data.statusCode != 200) {
    print(data.body);
    throw Error();
  }
}

Future<void> checkUncheck(String id) async {
  print(id);
  var data = await http.post(
    'https://trying-out-new-apps.herokuapp.com/todo/check/$id',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (data.statusCode != 200) {
    print(data.body);
    throw Error();
  }
}
