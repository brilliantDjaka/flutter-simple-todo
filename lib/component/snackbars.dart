import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void success(BuildContext context){
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text('success'),
      backgroundColor: Colors.green,
      duration: Duration(milliseconds: 500),
    )
  );
}

void onProcess(BuildContext context){
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text('on process'),
      backgroundColor: Colors.blue,
      duration: Duration(milliseconds: 500),
    )
  );
}

void error(BuildContext context){
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text('error'),
      backgroundColor: Colors.red,
      duration: Duration(milliseconds: 500),
    )
  );
}

