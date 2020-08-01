class TodoScema {
  String text;
  bool checked;
  String author = "brian";
  String id;
  TodoScema({this.checked, this.text,this.id});
  Map toMap() {
    return {"text": text, "isChecked": checked, "author": "Brian"};
  }
}
