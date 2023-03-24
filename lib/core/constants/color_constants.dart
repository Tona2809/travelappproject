import 'package:flutter/material.dart';

class ColorPalette {
  static const Color primaryColor = Color(0xFFFF9800);
  static const Color secondColor = Color(0xFF9c27B0);
  static const Color yellowColor = Color(0xffFE9C5E);

  static const Color dividerColor = Color(0xFFE5E7EB);
  static const Color textColor = Color(0xFF323B4B);
  static const Color subTitleColor = Color(0xFF83883);
  static const Color backgroundScaffoldColor = Color(0xFF2F2F2);
}

class Gradients {
  static const Gradient defaultGradientBg = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    colors: [
      ColorPalette.secondColor,
      ColorPalette.primaryColor,
    ],
  );
}
