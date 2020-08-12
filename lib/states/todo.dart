import 'package:flutter/widgets.dart';

class TodoState with ChangeNotifier {
  String _text;
  bool _isCheck = false;
  String id;
  
  TodoState(this._text);
  TodoState.fromMap(Map<String,dynamic> schema){
    _text = schema["text"];
    id = schema["_id"];
    _isCheck = schema["isCheck"];
  }

  get text => _text;
  get isCheck => _isCheck;
  
  void onCheck(){
    _isCheck = !_isCheck;
    notifyListeners();
  }

  Map toMap() {
    return {"text": _text, "isChecked": _isCheck, "author": "Brian"};
  }



}