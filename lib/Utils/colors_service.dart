import 'package:flutter/material.dart';

class ColorService {
  Color backgroundColor = const Color.fromARGB(255, 19, 168, 123);

  void updateBackgroundColor(Color value) {
    backgroundColor = value;
  }
}
