import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart' as checkbox;

class Todo extends StatefulWidget {
  final String text;
  final bool checked;
  final void Function() oncheck;
  const Todo({Key key, this.text, this.checked, this.oncheck})
      : super(key: key);
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300, spreadRadius: 3, blurRadius: 4),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                widget.text,
                style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
              ),
            ),
            checkbox.CircularCheckBox(
              value: widget.checked,
              inactiveColor: Colors.grey.shade300,
              activeColor: Color(0xff37d7b2),
              materialTapTargetSize: MaterialTapTargetSize.padded,
              onChanged: (bool _val) => widget.oncheck(),
            )
          ],
        ),
      ),
    );
  }
}
