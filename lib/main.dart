import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_otp/firebase_options.dart';
import 'package:phone_otp/home_screen.dart';
import 'package:phone_otp/login_screen.dart';
import 'package:phone_otp/otp_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Phone Auth",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: auth.currentUser != null ? HomeScreen() : LoginScreen(),
    );
  }
}
