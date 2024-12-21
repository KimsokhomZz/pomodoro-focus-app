import 'package:flutter/material.dart';

class PomoTimerPage extends StatefulWidget {
  const PomoTimerPage({super.key});

  @override
  State<PomoTimerPage> createState() => _PomoTimerState();
}

class _PomoTimerState extends State<PomoTimerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffffffff),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                // const EdgeInsets.only(top: 32, right: 40, bottom: 36, left: 40),
                const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.transparent, // No background color
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
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'ROUND 2',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff353935),
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  width: 268,
                  height: 268,
                  alignment: Alignment.center,
                  child: const Text(
                    '25:00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                      color: Color(0xff353935),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
