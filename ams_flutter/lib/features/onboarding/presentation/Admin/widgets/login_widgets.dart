import 'package:firebase_auth/firebase_auth.dart';

class FirebaseSignIn {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential?> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } catch (e) {
      return null;
    }
  }

  Future<bool> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      return false;
    }
  }
}

class StudentSignIn extends FirebaseSignIn {}
