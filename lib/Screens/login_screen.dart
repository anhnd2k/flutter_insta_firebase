import 'package:flutter/material.dart';
import 'package:flutter_insta_firebase/Untils/colors.dart';
import 'package:flutter_insta_firebase/Widgets/text-field-input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Instagram'),
            const SizedBox(
              height: 64,
            ),
            TextFieldInput(
              hintText: 'Enter your email',
              textInputType: TextInputType.emailAddress,
              textEditingController: _emailController,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldInput(
              hintText: 'Enter your password',
              textInputType: TextInputType.emailAddress,
              textEditingController: _passwordController,
              isPass: true,
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () => {},
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                decoration: const ShapeDecoration(
                    shape: (RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)))),
                    color: blueColor),
                child: const Text('Login'),
              ),
            )
            // TextFieldInput(
            //   hintText: 'Enter your password',
            //   textInputType: TextInputType.text,
            //   textEditingController: _passwordController,
            // )
          ],
        ),
      ),
    ));
  }
}
