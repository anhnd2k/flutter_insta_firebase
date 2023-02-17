import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_insta_firebase/Responsive/storage_methods.dart';
import 'package:flutter_insta_firebase/Models/user.dart' as models;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fileStore = FirebaseFirestore.instance;

  Future<models.User> getUserDetail() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _fileStore.collection('user').doc(currentUser.uid).get();
    return models.User.fromSnap(snap);
  }

  Future<Map<String, dynamic>> signUpUser({
    required String email,
    required String password,
    required String userName,
    required String bio,
    required Uint8List file,
  }) async {
    Map<String, dynamic> res = {
      'status': true,
      'mes': "Some error occurred origin code"
    };
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          userName.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        models.User user = models.User(
            userName: userName,
            uid: cred.user!.uid,
            email: email,
            bio: bio,
            follower: [],
            following: [],
            photoUrl: photoUrl);

        await _fileStore
            .collection('user')
            .doc(cred.user!.uid)
            .set(user.toJson());
        res['mes'] = 'SignUp Success';
        res['status'] = true;
        // await _fileStore.collection('user').add()
      }
    }
    // on FirebaseException catch(err){
    //   res['status'] = false;
    //   if(err.code == 'invalid-email'){
    //     res['mes'] = 'The email is badly formatted';
    //   } else if(err.code == 'weak-password'){
    //     res['mes'] = 'Your password should be at least 6 characters';
    //   }
    // }
    catch (err) {
      res['mes'] = err.toString();
      res['status'] = false;
    }
    return res;
  }

  Future loginUser({required String email, required String pass}) async {
    String res = 'Some err occurred';
    try {
      if (email.isNotEmpty && pass.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(email: email, password: pass);
        res = 'success';
      } else {
        res = 'Please enter all the fields';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
