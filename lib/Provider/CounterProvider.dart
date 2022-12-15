// ignore_for_file: file_names

import 'package:flutter/foundation.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  int get count => _counter;

  void increment() {
    _counter++;
    debugPrint(_counter.toString());
    notifyListeners();
  }
}
