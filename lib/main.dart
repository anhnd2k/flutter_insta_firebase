import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta_firebase/Responsive/mobile_screen_layout.dart';
import 'package:flutter_insta_firebase/Responsive/responsive_layout_screen.dart';
import 'package:flutter_insta_firebase/Responsive/web_screen_layout.dart';
import 'package:flutter_insta_firebase/Screens/home_screen.dart';
import 'package:flutter_insta_firebase/Screens/login_screen.dart';
import 'package:flutter_insta_firebase/Screens/sign_up_screen.dart';
import 'package:flutter_insta_firebase/Untils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA_p29RnNabpojS9-y8jodlxMazvUSyATQ",
            authDomain: "flutter-instagram-7ddd6.firebaseapp.com",
            projectId: "flutter-instagram-7ddd6",
            storageBucket: "flutter-instagram-7ddd6.appspot.com",
            messagingSenderId: "840370493125",
            appId: "1:840370493125:web:b66f77198f284c976042ac"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ));
      home: LoginScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('flutter instagram')),
    );
  }
}
