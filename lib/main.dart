import 'package:flutter/material.dart';
import 'package:focus_app_project/screens/pomo_timer.dart';
import 'package:focus_app_project/theme/theme.dart';
import 'package:focus_app_project/screens/login.dart';
import 'package:focus_app_project/screens/sign_up.dart';

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
      home: const PomoTimerPage(),
    );
  }
}
