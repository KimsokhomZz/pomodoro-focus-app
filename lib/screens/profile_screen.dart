import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      firstName = prefs.getString('firstName') ?? 'N/A';
      lastName = prefs.getString('lastName') ?? 'N/A';
      email = prefs.getString('email') ?? 'N/A';
      password = prefs.getString('password') ?? 'N/A';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    CupertinoIcons.arrow_left_circle,
                    size: 40,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'PROFILE',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff353935),
                ),
              ),
            ),
            const SizedBox(height: 18),
            const Center(
              child: CircleAvatar(
                radius: 70.0,
                backgroundImage: AssetImage('assets/images/Profile.PNG'),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'My Name',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xff353935),
              ),
            ),
            Text(
              '$firstName $lastName'.toUpperCase(),
              style: TextStyle(
                fontSize: 16,
                color: const Color(0xff353935).withOpacity(0.8),
              ),
            ),
            const Divider(),
            const Text(
              'Email Address',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xff353935),
              ),
            ),
            Text(
              email,
              style: TextStyle(
                fontSize: 16,
                color: const Color(0xff353935).withOpacity(0.8),
              ),
            ),
            const Divider(),
            const Text(
              'Password',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xff353935),
              ),
            ),
            Text(
              '*' *
                  password.length, // replace each password character with star
              style: TextStyle(
                fontSize: 16,
                color: const Color(0xff353935).withOpacity(0.8),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
