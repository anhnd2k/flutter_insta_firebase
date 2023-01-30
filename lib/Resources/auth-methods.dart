import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta_firebase/Responsive/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fileStore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> signUpUser({
    required String email,
    required String password,
    required String userName,
    required String bio,
    required Uint8List file,
  }) async {
    Map<String, dynamic> res = {
      'status': true,
      'mes': "Some error occurred"
    };
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          userName.isNotEmpty ||
          bio.isNotEmpty ||
          file != null
      ) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // print(cred.user!.uid);

        String photoUrl = await StorageMethods().uploadImageToStorage('profilePics', file, false);

        await _fileStore.collection('user').doc(cred.user!.uid).set({
          'userName': userName,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'follower': [],
          'following': [],
          'photoUrl': photoUrl
        });
        res['mes'] = 'SignUp Success';
        res['status'] = true;
        // await _fileStore.collection('user').add()
      }
    } catch (err) {
      res['mes'] = err.toString();
      res['status'] = false;
    }
    return res;
  }
}
