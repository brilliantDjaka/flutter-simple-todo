import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/helpers/query.dart' as query;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:simple_todo/states/auth.dart';
import 'package:simple_todo/states/todos.dart';
import 'package:simple_todo/pages/todo.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
  ],
);

class InitPage extends StatefulWidget {
  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  var isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isloading
            ? Text('loading')
            : RaisedButton(
                onPressed: () => signIn(context),
                child: Text(
                  'Login with google',
                ),
              ),
      ),
    );
  }

  void signIn(BuildContext context) async {
    setState(() {
      isloading = true;
    });
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
    if (_googleSignIn.currentUser.email != null) {
      print(_googleSignIn.currentUser.email);
      await initLoading(context,_googleSignIn.currentUser.email);
    }
    setState(() {
      isloading = false;
    });
  }

  Future<void> initLoading(BuildContext context,String email) async {
    var req = await query.getAllTodo(email);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider<AllTodoState>(
              create: (context) => (AllTodoState.fromList(req))),
          ChangeNotifierProvider<AuthState>(
            create: (context)=> (AuthState(email)),
          )
        ],
        child: Scaffold(body: TodoPages()),
      ),
    ));
  }
}
