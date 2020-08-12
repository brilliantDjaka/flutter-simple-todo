import 'package:flutter/material.dart';

class NewTodo extends StatefulWidget {
  final void Function(String) callback;

  const NewTodo({Key key, this.callback}) : super(key: key);
  
  @override
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 12, right: 12),
            child: Icon(Icons.add),
          ),
          Expanded(
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration.collapsed(hintText: 'add a todo'),
              cursorColor: Colors.black,
              onSubmitted: (text){
                  _textEditingController.clear();
                  widget.callback(text);
              },
            ),
          ),
        ],
      ),
    );
  }
}
