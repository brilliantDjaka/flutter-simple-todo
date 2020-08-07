import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);
class Auth extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Login'),
          onPressed: () async{
           var auth = await _googleSignIn.signIn();
           print(auth.email);
          },
        ),
      ),
    );
  }
}
