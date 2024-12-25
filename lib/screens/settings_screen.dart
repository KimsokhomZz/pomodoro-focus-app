import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus_app_project/widgets/heading_bar.dart';
import 'package:focus_app_project/widgets/timer_length_settngs.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadingBar(),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              'SETTINGS',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Color(0xff353935),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'timer length'.toUpperCase(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xff2E8B57),
            ),
          ),
          const SizedBox(height: 8),
          TimerLengthSettngs(
            title: 'Focus Session',
            duration: '25 Minutes',
            icon: CupertinoIcons.clock,
            onDurationTap: () {
              //choose timer session 25min or 30min or 45min
            },
          ),
          const Divider(),
          TimerLengthSettngs(
            title: 'Short Break',
            duration: '5 Minutes',
            icon: CupertinoIcons.arrow_clockwise,
            onDurationTap: () {
              //choose timer shortBreak 5min or 15min
            },
          ),
          const Divider(),
          TimerLengthSettngs(
            title: 'Long Break',
            duration: '15 Minutes',
            icon: CupertinoIcons.arrow_clockwise_circle,
            onDurationTap: () {
              //choose timer longBreak 15min or 30min
            },
          ),
          const Divider(),
          TimerLengthSettngs(
            title: 'Focus Round',
            duration: ' 4 ',
            icon: CupertinoIcons.arrow_2_circlepath,
            onDurationTap: () {
              //choose focus round 4round or 6round
            },
          ),
          const SizedBox(height: 32),
          Text(
            'general'.toUpperCase(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xff2E8B57),
            ),
          ),
          const SizedBox(height: 8),
          TimerLengthSettngs(
            title: 'Appearance Mode',
            duration: 'Light',
            icon: CupertinoIcons.circle_righthalf_fill,
            onDurationTap: () {
              //switch to dark mode
            },
          ),
          const SizedBox(height: 32),
          Text(
            'login'.toUpperCase(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xff2E8B57),
            ),
          ),
          const SizedBox(height: 8),
          TimerLengthSettngs(
            title: 'Add Account',
            duration: ' Add ',
            icon: CupertinoIcons.person_add_solid,
            onDurationTap: () {
              //add user aaccount
            },
          ),
          const Divider(),
          TimerLengthSettngs(
            title: 'Log Out',
            duration: 'Log Out',
            icon: CupertinoIcons.escape,
            onDurationTap: () {
              //switch to dark mode
            },
          ),
        ],
      ),
    );
  }
}
