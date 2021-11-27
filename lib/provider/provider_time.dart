import 'dart:async';

import 'package:flutter/material.dart';

class ProviderTime extends ChangeNotifier {
  static const Duration _duration = Duration(milliseconds: 50);
  Timer? _timer;

  static const Duration _maxSeconds = Duration(seconds: 180);
  Duration _seconds = _maxSeconds;
  bool _isRun = false;

  bool get isRun => _isRun;

  String get stringSeconds =>
      complete() ? 'complete' : _seconds.toString().split(".").first;
  double get value => _seconds.inSeconds / _maxSeconds.inSeconds;
  bool complete() {
    return _seconds == const Duration(seconds: 0);
  }

  bool get isStart => _seconds == _maxSeconds;
  void startTimer() {
    if (_seconds != const Duration()) {
      _isRun = true;
      notifyListeners();

      _timer = Timer.periodic(_duration, (timer) {
        _seconds = _seconds - _duration;
        if (_seconds == const Duration()) {
          timer.cancel();
        }
        notifyListeners();
      });
    }
  }

  void pauseTimer() {
    _isRun = false;
    if (_timer != null) {
      _timer!.cancel();
    }
    notifyListeners();
  }

  void stopTimer() {
    _isRun = false;
    if (_timer != null) {
      _timer!.cancel();
    }
    _seconds = _maxSeconds;
    notifyListeners();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }
}
