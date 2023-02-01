import 'package:flutter/material.dart';

class User {
  final String userName;
  final String email;
  final String uid;
  final String bio;
  final List follower;
  final List following;
  final String photoUrl;

  const User({
    required this.userName,
    required this.uid,
    required this.bio,
    required this.follower,
    required this.following,
    required this.photoUrl,
    required this.email
  });

  Map<String, dynamic> toJson() => {
    'userName': userName,
    'uid': uid,
    'email': email,
    'bio': bio,
    'follower': [],
    'following': [],
    'photoUrl': photoUrl
  };
}