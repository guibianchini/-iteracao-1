import 'dart:html';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import 'package:hello_word/models/user.dart';

class AppState extends ChangeNotifier {
  AppState() {
    init();
  }

  StreamSubscription<QuerySnapshot>? _studentsSubscription;
  List<Student> _students = [];
  List<Student> get students => _students;

  User? currentUser;

  Future<void> init() async {
    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _studentsSubscription = FirebaseFirestore.instance
            .collection('alunos')
            .orderBy('email')
            .snapshots()
            .listen((event) {
          _students = [];
          event.docs.forEach((element) {
            _students.add(Student(
                id: element.data()['userId'],
                name: null,
                email: element.data()['email']));
          });
        });
        notifyListeners();
      } else {
        _students = [];
        _studentsSubscription?.cancel();
      }
      notifyListeners();
    });
  }

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
      UserCredential cr = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await cr.user!.updateDisplayName(displayName);

      FirebaseFirestore.instance.collection('alunos').add({
        'displayName': cr.user!.displayName,
        'userId': cr.user!.uid,
        'email': cr.user!.email,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'role': 'user',
      });
      print(cr.toString());
      return true;
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
      return false;
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
    currentUser = null;
  }
}
