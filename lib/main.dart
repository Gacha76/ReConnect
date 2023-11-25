import 'package:call_app/constants/routes.dart';
import 'package:call_app/firebase_options.dart';
import 'package:call_app/screen/home_page.dart';
import 'package:call_app/screen/login_screens/forgot_screen.dart';
import 'package:call_app/screen/login_screens/login_page.dart';
import 'package:call_app/screen/login_screens/register_page.dart';
import 'package:call_app/screen/verify_screens/student_verify.dart';
import 'package:call_app/screen/verify_screens/teacher_verify.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Alumni Network",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      routes: {
        loginRoute: (context) => const LoginPage(),
        registerRoute: (context) => const RegisterPage(),
        forgotPasswordRoute: (context) => const ForgotPasswordPage(),
        homeRoute: (context) => const HomePage(),
        teacherVerifyRoute: (context) => const TeacherVerifyPage(),
        studentVerifyRoute: (context) => const StudentVerifyPage(),
      },
    );
  }
}
