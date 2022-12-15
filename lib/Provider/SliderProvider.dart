// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SliderProvider with ChangeNotifier {
  double _sliderValue = 0;

  double get sliderValue => _sliderValue;

  set sliderValue(double val) {
    _sliderValue = val;
    debugPrint(_sliderValue.toString());
    notifyListeners();
  }
}
