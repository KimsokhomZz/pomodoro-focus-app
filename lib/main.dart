import 'package:flutter/material.dart';
import 'package:focus_app_project/theme/theme.dart';
import 'package:focus_app_project/widgets/login.dart';
import 'package:focus_app_project/widgets/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: const SignUpPage(),
    );
  }
}
