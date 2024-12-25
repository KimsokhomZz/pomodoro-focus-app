import 'package:flutter/material.dart';
import 'package:focus_app_project/screens/profile_screen.dart';
import 'package:get/get.dart';

class HeadingBar extends StatelessWidget {
  const HeadingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Tooltip(
          message: 'Profile',
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent, // No background color
              shadowColor: Colors.transparent,
              padding: EdgeInsets.zero,
            ),
            onPressed: () {
              Get.to(() => const ProfileScreen());
            },
            child: Image.asset(
              'assets/icons/profile_icon.png',
            ),
          ),
        ),
      ],
    );
  }
}
