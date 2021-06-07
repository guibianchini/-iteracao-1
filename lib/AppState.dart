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
                name: element.data()['displayName'],
                email: element.data()['email']));
            print(_students);
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
      var crr = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await crr.user!.updateDisplayName(displayName);

      FirebaseFirestore.instance.collection('alunos').add({
        'displayName': displayName,
        'email': crr.user?.email,
        'role': "user",
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'userId': crr.user?.uid,
        'nota1': 0,
        'nota2': 0,
      });
      return true;
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
      return false;
    }
  }

  void updateGrades(Student student, num n1, num n2) async {
    String uniqueID = '';
    await FirebaseFirestore.instance
        .collection('alunos')
        .where('email', isEqualTo: student.email)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((documentSnapshot) {
        uniqueID = documentSnapshot.id.toString();
      });
    });
    await FirebaseFirestore.instance
        .collection('alunos')
        .doc(uniqueID)
        .update({"nota1": n1, "nota2": n2});
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
