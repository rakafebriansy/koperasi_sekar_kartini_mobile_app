import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static final AppColor instance = AppColor._();
  AppColorBorder border = AppColorBorder();
  AppColorText text = AppColorText();
  final Color primary = Color(0xFF008473);
  final Color darkPrimary = Color(0x026B5D);
  final Color transparentPrimary = Color(0xFF008473).withOpacity(0.12);
  final Color danger = Color(0xFFEA2929);
  final Color lightDanger = Color(0xFFFEE5E5);
  final Color lightPrimary = Color(0xFFE0F0EE);
  final Color gray = Color(0xFFDADADA);
  final Color lightGray = Color(0xFFF6F6F6);
  final Color info = Color(0xFF4A79CF);
}

class AppColorText {
  final Color gray = Color(0xFF686868);
}

class AppColorBorder {
  final Color primary = Color(0xFF008473);
  final Color danger = Color(0xFFCF4A4A);
  final Color lightDanger = Color(0xFFFEE5E5);
  final Color gray = Color(0xFF989898);
  final Color lightGray = Color(0xFFDADADA);
  final Color focus = Color(0xFF2979EA);
}
