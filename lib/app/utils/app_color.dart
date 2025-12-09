import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static final bg = _AppColorBg.instance;
  static final text = _AppColorText.instance;
  static final border = _AppColorBorder.instance;
}

class _AppColorBg {
  _AppColorBg._();
  static final _AppColorBg instance = _AppColorBg._();

  final Color primary = Color(0xFF008473);
  final Color darkPrimary = Color(0x026B5D);
  final Color transparentPrimary = Color(0xFF008473).withValues(alpha: 0.12);
  final Color danger = Color(0xFFEA2929);
  final Color lightDanger = Color(0xFFFEE5E5);
  final Color lightPrimary = Color(0xFFE0F0EE);
  final Color gray = Color(0xFFDADADA);
  final Color lightGray = Color(0xFFF6F6F6);
  final Color info = Color(0xFF4A79CF);
}

class _AppColorText {
  _AppColorText._();
  static final _AppColorText instance = _AppColorText._();

  final Color gray = Color(0xFF686868);
  final Color disabled = Color(0xFFA3ABBD);
}

class _AppColorBorder {
  _AppColorBorder._();
  static final _AppColorBorder instance = _AppColorBorder._();

  final Color primary = Color(0xFF008473);
  final Color danger = Color(0xFFCF4A4A);
  final Color lightDanger = Color(0xFFFEE5E5);
  final Color darkGray = Color(0xFF989898);
  final Color gray = Color(0xFFB9B9B9);
  final Color lightGray = Color(0xFFDADADA);
  final Color focus = Color(0xFF2979EA);
}
