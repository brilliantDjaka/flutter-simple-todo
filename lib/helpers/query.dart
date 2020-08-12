import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_todo/states/todo.dart';
Future<List<TodoState>> getAllTodo() async{
   var data = await http.get('https://trying-out-new-apps.herokuapp.com/todo');
   print(data.body);
   if(data.statusCode != 200) throw Error();
   var dataDecoded = json.decode(data.body);
   if(!(dataDecoded['data'] is List))throw Error();
   List<TodoState> todos = [];
   for (var data in dataDecoded['data']) {
     todos.add(TodoState.fromMap(data));
   }
   return todos;
}