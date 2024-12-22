import 'package:flutter/material.dart';
import 'package:focus_app_project/widgets/nav_bar.dart';
import 'package:focus_app_project/widgets/text_btn.dart';

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
                const EdgeInsets.only(top: 20, right: 40, bottom: 20, left: 40),
            // const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
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
                // Row(
                //   children: [
                //dot timer indicator
                //   ],
                // ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    // shadowColor: Colors.transparent,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    // Handle button press
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xffAFE1AF),
                          Color(0xff2E8B57),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(
                          20), // Match StadiumBorder shape
                    ),
                    child: Container(
                      width: 155,
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 26.0),
                      alignment: Alignment.center,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'CODING',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.computer_outlined,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextBtnWidget(
                      onClick: () {},
                      text: 'RESTART',
                    ),
                    TextBtnWidget(text: 'PAUSE', onClick: () {}),
                  ],
                ),
                const SizedBox(height: 16),
                TextBtnWidget(
                  onClick: () {},
                  text: 'START BREAK',
                  width: 355,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
