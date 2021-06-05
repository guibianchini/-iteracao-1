import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'services/auth.dart';

class AppState extends ChangeNotifier {
  AppState() {
    init();
  }

  Future<void> init() async {
    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loginState = LoginState.loggedIn;
        notifyListeners();
      }
      notifyListeners();
    });
  }

  LoginState _loginState = LoginState.notLogged;
  LoginState get loginState => _loginState;

  User? currentUser;

  String? _email;
  String? get email => _email;

  String? _password;
  String? get password => _password;

  Future<LoginState> signInWithEmailAndPassword(
    String email,
    String password,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      currentUser = FirebaseAuth.instance.currentUser;
      return LoginState.loggedIn;
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
      return LoginState.loginError;
    }
  }

  void registerAccount(String email, String displayName, String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(displayName);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
    _loginState = LoginState.notLogged;
  }
}
