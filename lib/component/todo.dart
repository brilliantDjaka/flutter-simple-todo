import 'package:flutter/material.dart';
class Todo extends StatefulWidget {
  final String text;
  final bool checked;
  final void Function() oncheck;
  const Todo({Key key, this.text, this.checked, this.oncheck}) : super(key: key);
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 0,
        bottom: 0
      ),
      child: Row(
        children: <Widget>[
          Checkbox(
            onChanged: (_){ 
            widget.oncheck();
          },
          value: widget.checked,),
          Text(widget.text)
        ],
      ),
    );
  }
}