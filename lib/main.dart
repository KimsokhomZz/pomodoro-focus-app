import 'package:flutter/material.dart';
import 'package:focus_app_project/models/time_provider.dart';
import 'package:focus_app_project/screens/login_screen.dart';
import 'package:focus_app_project/theme/theme.dart';
import 'package:focus_app_project/widgets/nav_bar.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TimerProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
      // home: const NavigationMenu(),
    );
  }
}
