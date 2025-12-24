import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_environment.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dialog_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/snackbar_helper.dart';

abstract class ErrorHelper {
  static Future<void> handleError(
    dynamic e, {
    bool canUseNavigator = true,
  }) async {
    if (Get.testMode) return;

    String? message;

    try {
      // string error
      if (e is String) {
        if (e.isNotEmpty) {
          return DialogHelper.showFailedDialog(e.tr);
        }
        return;
      }

      // dio error
      if (e is dio.DioException) {
        final response = e.response;
        final statusCode = response?.statusCode;
        final data = response?.data;

        if (e.type == dio.DioExceptionType.cancel) return; // cancelled request

        if (e.error is SocketException) {
          return DialogHelper.showFailedDialog(
            'Failed to connect to server',
          ); // server offline
        }

        // 401 - unauthorized
        if (statusCode == 401 && canUseNavigator && Get.context != null) {
          AuthController.instance.logout();
          return;
        }

        // 405 - method not allowed
        if (statusCode == 405) {
          return DialogHelper.showFailedDialog(
            'Request method is not allowed (405)',
          );
        }

        // 422 - validation error
        if (statusCode == 422 && config['backend_type'] == 'laravel') {
          final validationMessage = _extractLaravelValidationSafe(data);
          if (validationMessage != null && validationMessage.isNotEmpty) {
            return DialogHelper.showFailedDialog(
              validationMessage.tr,
              titleText: 'Input salah',
            );
          }
        }

        // safe parsing error message
        message = _extractMessageSafe(data: data, fallback: e.message);

        if (message != null && message!.isNotEmpty) {
          return DialogHelper.showFailedDialog(message!.tr);
        }

        // status code fallback
        switch (statusCode) {
          case 404:
            return DialogHelper.showFailedDialog('URL tidak ditemukan');
          case 500:
            return DialogHelper.showFailedDialog('Internal Server Error');
        }

        if (e.error != null) {
          return DialogHelper.showFailedDialog(e.error.toString());
        }
      }

      // network error
      if (e is HandshakeException || e is SocketException) {
        return DialogHelper.showFailedDialog('Gagal terkoneksi ke server');
      }

      if (e is FormatException) {
        return DialogHelper.showFailedDialog(e.source.toString());
      }

      // fallback
      debugPrint('ERROR: ${e.toString()}');
      return DialogHelper.showFailedDialog(e.toString().tr);
    } catch (err, stack) {
      debugPrint('ERROR_HELPER_CRASH: $err');
      debugPrint(stack.toString());

      return DialogHelper.showFailedDialog('Terjadi kesalahan tak terduga');
    }
  }

  static String? _extractMessageSafe({
    required dynamic data,
    String? fallback,
  }) {
    if (data == null) return fallback;

    if (data is String) return data;

    if (data is Map && data.containsKey('message')) {
      final msg = data['message'];

      if (msg is String) return msg;

      if (msg is Map) {
        final key = msg.keys.first;
        final value = msg[key];

        if (value is List && value.isNotEmpty) {
          return value.first.toString();
        }
        return value.toString();
      }

      if (msg is List && msg.isNotEmpty) {
        return msg.first.toString();
      }

      return msg.toString();
    }

    return fallback;
  }

  static String? _extractLaravelValidationSafe(dynamic data) {
    if (data is! Map) return null;
    if (!data.containsKey('errors')) return null;

    final errors = data['errors'];
    if (errors is! Map || errors.isEmpty) return null;

    final firstKey = errors.keys.first;
    final value = errors[firstKey];

    if (value is List && value.isNotEmpty) {
      return value.first.toString();
    }

    return value.toString();
  }
}
