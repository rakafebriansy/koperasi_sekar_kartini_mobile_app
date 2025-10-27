import 'package:flutter/foundation.dart';

abstract class Environments {
  static EnvironmentsMode mode = !kReleaseMode ? EnvironmentsMode.development : EnvironmentsMode.production;
  // static EnvironmentsMode mode = EnvironmentsMode.production;

  static String get apiUrl => mode.isDevelopment ? 'http://example-dev/' : 'http://example.com/';
}

enum EnvironmentsMode {
  development,
  production;

  bool get isDevelopment => this == development;

  bool get isProduction => this == production;
}
