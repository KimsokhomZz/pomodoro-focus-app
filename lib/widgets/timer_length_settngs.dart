import 'package:flutter/material.dart';

class TimerLengthSettngs extends StatelessWidget {
  final String title;
  final String duration;
  final VoidCallback onDurationTap;
  final IconData? icon;

  const TimerLengthSettngs({
    super.key,
    required this.title,
    required this.duration,
    required this.icon,
    required this.onDurationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(1, 1),
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Icon(icon),
        ),
        const SizedBox(width: 16),
        Text(
          title,
          style: const TextStyle(
              fontSize: 18,
              color: Color(0xff353935),
              fontWeight: FontWeight.w500),
        ),
        const Spacer(),
        InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: onDurationTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
            decoration: BoxDecoration(
              color: const Color(0xff353935).withOpacity(0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              duration,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
