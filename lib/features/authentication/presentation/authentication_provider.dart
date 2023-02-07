import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationProvider with ChangeNotifier {
  AuthenticationProvider() {
    if (FirebaseAuth.instance.currentUser != null) {
      _state = Authenticated();
    }
  }
  AuthenticationState _state = UnAuthenticated();
  AuthenticationState get state => _state;

  Future<User?> logIn(Map<String, dynamic> credential) async {
    late final UserCredential userCredential;
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: credential['email'],
      password: credential['password'],
    )
        .then(
      (UserCredential value) {
        userCredential = value;

        if (userCredential.user != null) {
          _state = Authenticated();
          notifyListeners();
        }

        return userCredential.user;
      },
    );
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut().then(
      (_) {
        _state = UnAuthenticated();

        notifyListeners();

        return;
      },
    );
  }
}

abstract class AuthenticationState {}

class UnAuthenticated extends AuthenticationState {}

class Authenticated extends AuthenticationState {}
