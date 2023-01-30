import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_insta_firebase/Resources/auth-methods.dart';
import 'package:flutter_insta_firebase/Untils/Utils.dart';
import 'package:image_picker/image_picker.dart';

import '../Widgets/text-field-input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  final TextEditingController _confirmPassWordController =
      TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  Uint8List? _image;

  bool checkFillData = false;
  String textWarning = 'Bạn phải nhập đủ các trường trên để tiếp tục';

  @override
  void dispose() {
    super.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _passWordController.dispose();
    _confirmPassWordController.dispose();
    _bioController.dispose();
  }

  void resolveData() async {
    if (_emailController.text == '' ||
        _userNameController.text == '' ||
        _passWordController.text == '' ||
        _confirmPassWordController.text == '' ||
        _bioController.text == '') {
      setState(() {
        checkFillData = true;
        textWarning = 'Bạn phải nhập đủ các trường trên để tiếp tục';
      });
    } else {
      setState(() {
        checkFillData = false;
      });
      if (_passWordController.text != _confirmPassWordController.text) {
        setState(() {
          checkFillData = true;
          textWarning = 'Mật khẩu không khớp';
        });
        return;
      }
      // resolve in here ...
      Map<String, dynamic> res = (await AuthMethods().signUpUser(
          email: _emailController.text,
          password: _passWordController.text,
          userName: _userNameController.text,
          bio: _bioController.text,
          file: _image!,
      ));
      if (res['status'] == false) {
        print(res['mes']);
        setState(() {
          checkFillData = true;
          textWarning = res['mes'];
        });
      } else {
        print(res['mes']);
        setState(() {
          checkFillData = false;
        });
      }
    }
  }

  void selectedImage() async {
  Uint8List image = await pickImage(ImageSource.gallery);
  setState(() {
    _image = image;
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                Stack(
                  children: [
                    _image != null ?
                      CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(_image!),
                      )
                      : CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                          'https://scontent.fhan5-2.fna.fbcdn.net/v/t39.30808-6/322008412_1337631317066980_3890455477156250928_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=FItW1FY4mFAAX8OMJeq&_nc_ht=scontent.fhan5-2.fna&oh=00_AfCWYxVMndnyfUYopgxCaU9YANlHF7FYRzAMa-RIDaDDww&oe=63DD33CD'),
                    ),
                    Positioned(
                      child: IconButton(
                        onPressed: selectedImage,
                        icon: const Icon(Icons.add_a_photo),
                      ),
                      bottom: -10,
                      left: 80,
                    )
                  ],
                ),
                const SizedBox(height: 20),
                TextFieldInput(
                  hintText: 'Enter your user name',
                  textInputType: TextInputType.text,
                  textEditingController: _userNameController,
                ),
                const SizedBox(height: 20),
                TextFieldInput(
                  hintText: 'Enter your email',
                  textInputType: TextInputType.text,
                  textEditingController: _emailController,
                ),
                const SizedBox(height: 20),
                TextFieldInput(
                  textEditingController: _passWordController,
                  hintText: 'Enter your password',
                  textInputType: TextInputType.text,
                  isPass: true,
                ),
                const SizedBox(height: 20),
                TextFieldInput(
                  textEditingController: _confirmPassWordController,
                  hintText: 'Confirm your password',
                  textInputType: TextInputType.text,
                  isPass: true,
                ),
                const SizedBox(height: 20),
                TextFieldInput(
                  textEditingController: _bioController,
                  hintText: 'Enter bio',
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 20),
                Visibility(
                  child: Text(
                    textWarning,
                    style: TextStyle(color: Colors.red),
                  ),
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: checkFillData,
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: resolveData,
                  child: Container(
                    child: const Text('Sign Up'),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        color: Colors.blue),
                  ),
                ),
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
