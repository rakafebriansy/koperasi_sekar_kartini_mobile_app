import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class TokenManager {
  static FlutterSecureStorage secureStorage = Get.find<FlutterSecureStorage>();
  final String _tokenKey = 'token';

  Future<String?> getToken() => secureStorage.read(key: _tokenKey);
  Future<void> setToken(String? value) =>
      secureStorage.write(key: _tokenKey, value: value);
  Future<void> deleteToken() => secureStorage.delete(key: _tokenKey);
}
