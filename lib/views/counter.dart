import 'package:flutter/material.dart';
import 'dart:math' as math;

class Counter extends ChangeNotifier {
  Color _color = Colors.yellow;
  var _count = 0;

  Color get getCounter {
    return _color;
  }

  void incrementCounter() {
    _color =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    print(_color);
    notifyListeners();
  }
}
