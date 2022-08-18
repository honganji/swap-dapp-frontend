import 'package:flutter/material.dart';

class UsersViewModel extends ChangeNotifier {
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  signIn() {
    _isSignedIn = true;
    notifyListeners();
  }
}
