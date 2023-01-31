import 'package:flutter/material.dart';
import 'package:flutter_insta_firebase/Resources/auth-methods.dart';
import 'package:flutter_insta_firebase/Responsive/mobile_screen_layout.dart';
import 'package:flutter_insta_firebase/Responsive/responsive_layout_screen.dart';
import 'package:flutter_insta_firebase/Responsive/web_screen_layout.dart';
import 'package:flutter_insta_firebase/Screens/home_screen.dart';
import 'package:flutter_insta_firebase/Screens/sign_up_screen.dart';
import 'package:flutter_insta_firebase/Untils/Utils.dart';
import 'package:flutter_insta_firebase/Untils/colors.dart';
import 'package:flutter_insta_firebase/Widgets/text-field-input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passWordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String _res = await AuthMethods().loginUser(
        email: _emailController.text, pass: _passWordController.text);
    setState(() {
      _isLoading = false;
    });
    if (_res == 'success') {
      // navigate screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
              webScreenLayout: WebScreenLayout(),
              mobileScreenLayout: MobileScreenLayout())));
    } else {
      showSnackBar(_res, context);
    }
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
                // const Text(
                //   'Instagram',
                //   style: TextStyle(color: Colors.white),
                // ),
                const Text(
                  "Instagram",
                  style: TextStyle(fontFamily: 'Billabong', fontSize: 35),
                ),
                const SizedBox(height: 40),
                TextFieldInput(
                  hintText: 'Enter your user name',
                  textInputType: TextInputType.text,
                  textEditingController: _emailController,
                ),
                const SizedBox(height: 40),
                TextFieldInput(
                  textEditingController: _passWordController,
                  hintText: 'Enter your pass word',
                  textInputType: TextInputType.text,
                  isPass: true,
                ),
                const SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    !_isLoading ? loginUser() : null;
                  },
                  child: Container(
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
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          )
                        : const Text('Login'),
                  ),
                ),
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text("Don't have an account? "),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text(
                          "Sign up.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
