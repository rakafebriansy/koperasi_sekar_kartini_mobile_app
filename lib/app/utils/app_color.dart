import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColor {
  static AppColorBorder border = AppColorBorder();
  static Color primary = Color(0xFF008473);
  static Color transparentPrimary = Color(0xFF008473).withOpacity(0.12);
  static Color danger = Color(0xFFEA2929);
  static Color lightDanger = Color(0xFFFEE5E5);
  static Color lightPrimary = Color(0xFFE0F0EE);
  static Color gray = Color(0xFFDADADA);
}

class AppColorBorder {
  Color primary = Color(0xFF008473);
  Color danger = Colors.red;
  Color lightDanger = Color(0xFFFEE5E5);
  Color gray = Color(0xFF989898);
  Color lightGray = Color(0xFFDADADA);
  Color focus = Color(0xFF2979EA);
}
