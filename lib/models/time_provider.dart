import 'dart:async';
import 'package:flutter/cupertino.dart';

class TimerProvider with ChangeNotifier {
  int _seconds = 0;
  int _minutes = 25;
  // int _minutes = 1;  //for testing
  int _currentRound = 1;
  Timer? _timer;
  bool _isPaused = true;
  bool _isShortBreak = false;

  bool get isPaused => _isPaused;
  int get seconds => _seconds;
  int get minutes => _minutes;
  int get currentRound => _currentRound;
  bool get isShortBreak => _isShortBreak;

  //start the timer
  void startTimer() {
    _isPaused = false;
    _startTimer();
    notifyListeners();
  }

  //pause the timer
  void pauseTimer() {
    _isPaused = true;
    _timer?.cancel();
    notifyListeners();
  }

  //resume the timer
  void resumeTimer() {
    _isPaused = false;
    _startTimer();
    notifyListeners();
  }

  // Method to restart the timer
  void restartTimer() {
    _isPaused = true;
    _minutes = 25; // Reset to initial time
    _seconds = 0;
    _isShortBreak = false;
    _timer?.cancel();
    notifyListeners();
  }

  // Method to handle short break timer
  void shortBreak() {
    _isPaused = true;
    _minutes = 5; // Short break time
    _seconds = 0;
    _isShortBreak = true;
    _timer?.cancel();
    notifyListeners();
  }

  void _startTimer() {
    if (_timer != null && _timer!.isActive) {
      return; // Prevent starting a new timer if the existing one is still active
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds == 0 && _minutes == 0) {
        if (_isShortBreak) {
          restartTimer();
        } else {
          // Update the round and reset the timer
          if (_currentRound < 4) {
            _currentRound++;
          } else {
            _currentRound = 1; // Reset to ROUND 1 after ROUND 4
          }
          restartTimer(); // Reset to 25:00 but do not start
        }
      } else if (_seconds == 0) {
        _minutes--;
        _seconds = 59;
      } else {
        _seconds--;
      }
      notifyListeners();
    });
  }
}
