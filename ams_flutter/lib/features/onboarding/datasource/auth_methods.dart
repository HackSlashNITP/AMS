import 'dart:typed_data';

import 'package:ams_flutter/features/onboarding/datasource/storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Authmethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> SignUpStudent(
      {required String name,
      required String email,
      required String password,
      required String branch,
      required String roll,
      required String section,
      required Uint8List? file}) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          name.isNotEmpty ||
          branch.isNotEmpty ||
          roll.isNotEmpty ||
          section.isNotEmpty ||
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);

        String photoUrl =
            await Storagemethods().UploadImageToStorage(roll.toString(), file!);

        _firestore.collection('student').doc(roll.toString()).set({
          'name': name,
          'email': email,
          'roll': roll,
          'image': photoUrl,
          'branch': branch,
          'section': section,
        });
      }

      print("$name added to the database");
      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }
}
