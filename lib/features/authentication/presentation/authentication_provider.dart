import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {
  AuthenticationState _state = UnAuthenticated();
  AuthenticationState get state => _state;

  void logIn() {
    _state = Authenticated();

    notifyListeners();
  }

  void logOut() {
    _state = UnAuthenticated();

    notifyListeners();
  }
}

abstract class AuthenticationState {}
class UnAuthenticated extends AuthenticationState {}
class Authenticated extends AuthenticationState {}