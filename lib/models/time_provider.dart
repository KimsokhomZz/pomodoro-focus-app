import 'dart:async';
import 'package:flutter/cupertino.dart';

class TimerProvider with ChangeNotifier {
  int _seconds = 0;
  int _minutes = 25;
  Timer? _timer;
  bool _isPaused = true;
  bool get isPaused => _isPaused;

  int get seconds => _seconds;
  int get minutes => _minutes;

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
    _timer?.cancel();
    notifyListeners();
  }

  // Method to handle short break timer
  void shortBreak() {
    _isPaused = true;
    _minutes = 5; // Short break time
    _seconds = 0;
    _timer?.cancel();
    notifyListeners();
  }

  //start or resume the timer
  void _startTimer() {
    if (_timer != null && _timer!.isActive) {
      return; //prevent starting a new timer if the existing one is still active
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds == 0 && _minutes == 0) {
        _stopTimer();
      } else if (_seconds == 0) {
        _minutes--;
        _seconds = 59;
      } else {
        _seconds--;
      }
      notifyListeners();
    });
  }

  //stop the timer
  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
    _isPaused = true;
    notifyListeners();
  }
}
