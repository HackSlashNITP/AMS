import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';

class Storagemethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> UploadImageToStorage(String Childname, Uint8List file) async {
    Reference ref = _storage.ref().child(Childname);

    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot Snap = await uploadTask;
    String downloadUrl = await Snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
