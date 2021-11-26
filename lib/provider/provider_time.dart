import 'dart:async';

import 'package:flutter/material.dart';

class ProviderTime extends ChangeNotifier {
  static const Duration duration = Duration(seconds: 1);
  Timer? _timer;

  static const Duration maxSeconds = Duration(seconds: 180);
  Duration seconds = maxSeconds;
  bool isRun = false;

  String get stringSeconds => format(seconds);
  double get value => seconds.inSeconds / maxSeconds.inSeconds;

  bool isStart() {
    return seconds == maxSeconds;
  }

  void startTimer() {
    if (seconds != const Duration()) {
      isRun = true;
      notifyListeners();

      _timer = Timer.periodic(duration, (timer) {
        seconds = seconds - duration;
        if (seconds == const Duration()) {
          timer.cancel();
        }
        notifyListeners();
      });
    }
  }

  void pauseTimer() {
    isRun = false;
    if (_timer != null) {
      _timer!.cancel();
    }
    notifyListeners();
  }

  void stopTimer() {
    isRun = false;
    if (_timer != null) {
      _timer!.cancel();
    }
    seconds = maxSeconds;
    notifyListeners();
  }

  String format(Duration duration) {
    if (duration == const Duration()) {
      return "Over!";
    } else {
      return duration.toString().split(".").first;
    }
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }
}
