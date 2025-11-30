import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/connectivity_result/connectivity_result_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/list/list_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/snackbar_helper.dart';
import 'package:network_info_plus/network_info_plus.dart';

abstract class ConnectivityHelper {
  static RxList<ConnectivityResult> currentConnectivity = RxList();
  static final Dio _dio = Dio();

  static Future<void> init() async {
    Connectivity().onConnectivityChanged.listen((result) async {
      bool areEqualTo =
          ConnectivityHelper.currentConnectivity.areEqualTo(result);
      if (areEqualTo) return;
      ConnectivityHelper.currentConnectivity.value = result;
    });
  }

  static bool ensureOnlineConnection({bool withMessage = true}) {
    if (currentConnectivity.isOffline) {
      if (withMessage) {
        SnackbarHelper.showSnackbar(messageText: 'txt_offline'.tr);
      }
      return false;
    }

    return true;
  }

  static Future<String?> getPublicIp() async {
    try {
      final response = await _dio.get(
        'https://api.ipify.org',
        queryParameters: {'format': 'json'},
        options: Options(
          responseType: ResponseType.json,
          receiveTimeout: const Duration(seconds: 5),
        ),
      );

      if (response.statusCode == 200) {
        final data =
            response.data is String ? jsonDecode(response.data) : response.data;

        return data['ip'] as String?;
      } else {
        print('Request gagal: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Gagal mendapatkan IP: $e');
      return null;
    }
  }

  static Future<String?> getWifiIP() async {
    final info = NetworkInfo();
    final ip = await info.getWifiIP();
    return ip;
  }
}
