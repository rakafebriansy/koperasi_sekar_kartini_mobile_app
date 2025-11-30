import 'package:flutter/foundation.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_constant.dart';

abstract class Environments {
  static EnvironmentsMode mode = !kReleaseMode ? EnvironmentsMode.development : EnvironmentsMode.production;
  // static EnvironmentsMode mode = EnvironmentsMode.production;
  static String get apiUrl => mode.isDevelopment ? '$DEVELOPMENT_BASE_URL/api' : 'http://example.com/';
}

enum EnvironmentsMode {
  development,
  production;

  bool get isDevelopment => this == development;

  bool get isProduction => this == production;
}
