import 'package:flutter/cupertino.dart';
import 'package:flutter_insta_firebase/Resources/auth-methods.dart';
import '../Models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();
  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user;
    notifyListeners();
  }
}
