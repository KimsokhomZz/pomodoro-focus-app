import 'package:flutter/material.dart';

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
              //navigate to profile page
              print('Navigate to profile page');
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
