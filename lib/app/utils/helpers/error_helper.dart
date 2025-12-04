import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dialog_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/snackbar_helper.dart';

abstract class ErrorHelper {
  static const Map<String, String> config = {
    'backend_type' : 'laravel'
  };

  static String? extractLaravelValidation(dio.Response? res) {
    if (res?.data is! Map) return null;

    final data = res!.data;

    if (data["errors"] is Map) {
      final Map errors = data["errors"];
      final key = errors.keys.first;

      if (errors[key] is List && errors[key].isNotEmpty) {
        return errors[key][0];
      }
      return errors[key].toString();
    }

    return null;
  }

  static Future<void> handleError(
    dynamic e, {
    bool canUseNavigator = true,
  }) async {
    String? message;

    if (e is String) {
      message = e;

      if (message.isNotEmpty) return DialogHelper.showFailedDialog(message.tr);
    }

    if (e is dio.DioException) {
      if (e.type == dio.DioExceptionType.cancel) return;

      if (e.response?.statusCode == 422 && config['backend_type'] == 'laravel') {
        final msg = extractLaravelValidation(e.response);
        if (msg != null && msg.isNotEmpty) {
          return DialogHelper.showFailedDialog(msg.tr, titleText: 'Input salah');
        }
      }

      if (e.message == 'You are offline') {
        try {
          return SnackbarHelper.showSnackbar(messageText: 'Anda sedang offline');
        } catch (e) {
          // Ignored, really
        }
      }

      if (e.response?.statusCode == 401 &&
          canUseNavigator &&
          Get.context != null) {
        AuthController.find.logout();
      }

      if (e.response?.data?['message'] is Map) {
        Map map = e.response?.data?['message'] as Map;
        String key = map.keys.first;

        if (map[key] is List) {
          message = (map[key] as List).first;
        } else {
          message = map[key];
        }
      } else {
        message =
            e.response?.data?['message']?.toString() ??
            e.response?.data?.toString() ??
            e.message;
      }

      if (message != null && message.isNotEmpty) {
        return DialogHelper.showFailedDialog(message.tr);
      }

      if (e.error is HandshakeException || e.error is SocketException) {
        return DialogHelper.showFailedDialog('Gagal terhubung ke server');
      } else if (e.error is FormatException) {
        return DialogHelper.showFailedDialog(
          (e.error as FormatException).source.toString(),
        );
      } else {
        switch (e.response?.statusCode) {
          case 404:
            return DialogHelper.showFailedDialog('URL tidak ditemukan');
          case 500:
            return DialogHelper.showFailedDialog(
              'Internal Server Error',
            );
          default:
            if (e.error != null)
              return DialogHelper.showFailedDialog(e.error.toString());
        }
      }
    }

    if (e is HandshakeException || e is SocketException) {
      return DialogHelper.showFailedDialog('Gagal terkoneksi ke server');
    } else if (e is FormatException) {
      return DialogHelper.showFailedDialog(e.source.toString());
    } else if (e == 'You are offline') {
      try {
        // return SnackbarHelper.showSnackbar(messageText: 'Anda sedang offline');
      } catch (e) {
        // Ignored, really
      }
    }

    print("ERROR: ${e.toString().tr}");

    return DialogHelper.showFailedDialog(e.toString().tr);
  }
}
