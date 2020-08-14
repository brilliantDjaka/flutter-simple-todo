import 'package:flutter/widgets.dart';

class AuthState with ChangeNotifier{
  String _email;
  AuthState(this._email);
  String get email => _email;
}