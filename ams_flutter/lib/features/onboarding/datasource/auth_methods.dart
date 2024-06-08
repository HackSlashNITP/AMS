import 'dart:convert';
import 'dart:typed_data';

import 'package:ams_flutter/features/onboarding/datasource/storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;



class Authmethods {
   final String ip = "192.168.242.144"; 

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

 Future<String> SignUpStudent({
  required String name,
  required String email,
  required String password,
  required String branch,
  required String roll,
  required String section,
  required Uint8List? file,
}) async {
  String res = "Some error occurred";
  try {
    if (email.isNotEmpty ||
        password.isNotEmpty ||
        name.isNotEmpty ||
        branch.isNotEmpty ||
        roll.isNotEmpty ||
        section.isNotEmpty ||
        file != null) {
      
      // Create user in Firebase Auth
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(cred.user!.uid);

      // Upload image to Firebase Storage
      String photoUrl =
          await Storagemethods().UploadImageToStorage(roll.toString(), file!);

      // Save user data to Firestore
      await _firestore.collection('student').doc(roll.toString()).set({
        'name': name,
        'email': email,
        'roll': roll,
        'image': photoUrl,
        'branch': branch,
        'section': section,
      });

      // Make API call to save user data to SQL database
      var url = Uri.parse('http://$ip:8001/student/register'); // Replace with your actual API URL
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'studentId': roll,
          'name': name,
          'department': branch,
          'section': section,
          'mergedClassroomId': null, // Update if you have this data
        }),
      );

      if (response.statusCode == 201) {
        res = "Success";
      } else {
        res = "Failed to save to SQL: ${response.body}";
      }
    }
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
