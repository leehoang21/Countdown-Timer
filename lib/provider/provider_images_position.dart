import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProviderImagePosition extends ChangeNotifier {
  double _soft = 0.35;
  double _poached = 1.35;
  double _hardBoiled = 2.35;
  double get soft => _soft;
  double get poached => _poached;
  double get hardBoiled => _hardBoiled;

  double get screenSoft => ScreenUtil().screenWidth * _soft;

  double get screenpoached => ScreenUtil().screenWidth * _poached;

  double get screenhardBoiled => ScreenUtil().screenWidth * _hardBoiled;

  void setImagePosition(int value) {
    _soft = _soft + value;
    _poached = _poached + value;
    _hardBoiled = _hardBoiled + value;
    notifyListeners();
  }
}
