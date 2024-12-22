import 'package:flutter/material.dart';

class TextBtnWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final double width;
  final double height;
  const TextBtnWidget(
      {super.key,
      required this.onClick,
      required this.text,
      this.width = 144,
      this.height = 45});

  @override
  Widget build(BuildContext context) {
    // bool isClick = false;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(10), // Optional: Match the button shape
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            spreadRadius: 2, // Spread the shadow
            blurRadius: 5, // Blur radius for softer shadow
            offset: const Offset(2, 2), // Shadow direction
          ),
        ],
      ),
      child: TextButton(
        onPressed: onClick,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: const Color(0xffffffff),
          foregroundColor: const Color(0xff2E8B57), //pressing color
          shadowColor: Colors.transparent, // Remove default shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Color(0xff353935),
            height: 0.7,
          ),
        ),
      ),
    );
  }
}
