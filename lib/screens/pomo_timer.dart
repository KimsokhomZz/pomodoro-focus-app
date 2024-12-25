// import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus_app_project/models/time_provider.dart';
import 'package:focus_app_project/widgets/heading_bar.dart';
// import 'package:focus_app_project/widgets/nav_bar.dart';
import 'package:focus_app_project/widgets/text_btn.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PomoTimerPage extends StatefulWidget {
  const PomoTimerPage({super.key});

  @override
  State<PomoTimerPage> createState() => _PomoTimerState();
}

class _PomoTimerState extends State<PomoTimerPage> {
  final NumberFormat _formatter = NumberFormat('00');
  final int _totalMinutes = 25;

  // void _showTimeUpDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text("Time's up!"),
  //       content: const Text('Take a short break or restart the time'),
  //       actions: [
  //         TextButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //           },
  //           child: const Text('OK'),
  //         )
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);

    // Calculate the total seconds that have passed if the timer is running
    int elapsedTimeInSeconds = 0;
    double progress = 0.0;
    if (!timerProvider.isPaused) {
      elapsedTimeInSeconds = (_totalMinutes - timerProvider.minutes) * 60 +
          (60 - timerProvider.seconds);
      int totalTimeInSeconds = _totalMinutes * 60; // Total time in seconds
      progress = elapsedTimeInSeconds /
          totalTimeInSeconds; // Calculate the progress (percentage)
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HeadingBar(),
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
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  // alignment: Alignment.center,
                  child: CircularProgressIndicator(
                      backgroundColor: Color(0xffAFE1AF),
                      value: progress,
                      strokeWidth: 10,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xff2E8B57))),
                ),
                Text(
                  '${_formatter.format(timerProvider.minutes)} : ${_formatter.format(timerProvider.seconds)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                    color: Color(0xff353935),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),
            // Row(
            //   children: [
            //dot timer indicator
            //   ],
            // ),
            ElevatedButton(
              onPressed: () {
                if (timerProvider.isPaused) {
                  timerProvider.startTimer();
                } else {
                  timerProvider.resumeTimer();
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                shape: const StadiumBorder(),
              ),
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
                  borderRadius:
                      BorderRadius.circular(20), // Match StadiumBorder shape
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
                        'START',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        CupertinoIcons.play_arrow_solid,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextBtnWidget(
                  onClick: () {
                    timerProvider.restartTimer(); // Restart the timer
                  },
                  text: 'RESTART',
                ),
                TextBtnWidget(
                  text: 'PAUSE',
                  onClick: () {
                    timerProvider.pauseTimer();
                  },
                  textColor: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextBtnWidget(
              onClick: () {
                timerProvider.shortBreak();
              },
              text: 'START SHORT BREAK',
              width: 355,
            ),
          ],
        ),
      ),
    );
  }
}
