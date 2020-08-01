import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_todo/schema/todo_schema.dart';
Future<List<TodoScema>> getAllTodo() async{
   var data = await http.get('https://trying-out-new-apps.herokuapp.com/todo');
   print(data.body);
   if(data.statusCode != 200) throw Error();
   var dataDecoded = json.decode(data.body);
   if(!(dataDecoded['data'] is List))throw Error();
   List<TodoScema> todos = <TodoScema>[];
   for (var data in dataDecoded['data']) {
     todos.add(TodoScema(
       checked: data['isCheck'],
       text: data['text'],
       id: data['_id']
     ));
   }
   return todos;
}