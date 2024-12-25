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

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);

    // Determine the total minutes for the timer (25 for work, 5 for short break)
    int totalMinutes = timerProvider.isShortBreak ? 5 : 25;

    // Total time in seconds based on the current state (either 25 or 5 minutes)
    int totalTimeInSeconds = totalMinutes * 60;

    // Remaining time in seconds
    final int remainingTimeInSeconds = (timerProvider.minutes * 60) + timerProvider.seconds;

    // Calculate progress based on the total time
    double progress = 1.0 - (remainingTimeInSeconds / totalTimeInSeconds);

    // Ensure progress is between 0.0 and 1.0
    progress = progress.clamp(0.0, 1.0);

    // Debugging for testing output
    // print(
    //     'Total Time: $totalTimeInSeconds, Remaining Time: $remainingTimeInSeconds, Progress: $progress');

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HeadingBar(),
            const SizedBox(height: 8),
            Text(
              'ROUND ${timerProvider.currentRound}',
              style: const TextStyle(
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
                  child: CircularProgressIndicator(
                      backgroundColor: const Color(0xffAFE1AF),
                      value: progress,
                      strokeWidth: 10,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xff2E8B57))),
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
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: timerProvider.currentRound > index
                        ? const Color(0xff2E8B57)
                        : const Color(0xffAFE1AF),
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),
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
                      SizedBox(width: 18),
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
