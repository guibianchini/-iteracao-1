import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

enum LoginState {
  loggedIn,
  notLogged,
}

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

  Future<bool> signInWithEmailAndPassword(
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

      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      errorCallback(e);
      return false;
    }
  }

  Future<bool> registerUser(String email, String displayName, String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!
          .updateDisplayName(displayName)
          .then((value) => FirebaseFirestore.instance.collection('alunos').add({
                'userId': credential.user!.uid,
                'displayName': credential.user!.displayName,
                'email': credential.user!.email,
                'timestamp': DateTime.now().millisecondsSinceEpoch,
                'role': 'user',
              }));

      return true;
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
      return false;
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
    _loginState = LoginState.notLogged;
  }
}
