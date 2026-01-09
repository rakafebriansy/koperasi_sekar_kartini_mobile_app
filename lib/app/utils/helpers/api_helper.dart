import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/remote/download_client/download_client.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/remote/serialization/model_registry.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/remote/api_client/api_client.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/remote/serialization/response_parser.dart';
import 'package:permission_handler/permission_handler.dart';

typedef FromJson<T> = T Function(Map<String, dynamic> json);

class ApiHelper {
  static ApiHelper instance = Get.find<ApiHelper>();

  Future<T> fetch<T>({
    required Future<dynamic> Function(ApiClient api) request,
    Map<String, dynamic> headers = const {},
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
  }) async {
    final apiClient = await ApiClient.create(
      headers: headers,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );

    if (apiClient == null) throw Exception('API Client is null');

    final raw = await request(apiClient);

    final response = ResponseParser.parse<T>(raw, (dataObj) {
      if (T == int || T == double || T == String || T == bool) {
        return dataObj as T;
      }
      return ModelRegistry.fromJson<T>(dataObj);
    });

    if (response.success == false) {
      throw Exception("API returned false");
    }

    if (response.data == null) {
      throw Exception("API returned null data for type $T");
    }

    if (response.token != null) {
      AuthController.instance.tokenManager.setToken(response.token);
    }

    return response.data as T;
  }

  Future<List<T>> fetchList<T>({
    required Future<dynamic> Function(ApiClient api) request,
    Map<String, dynamic> headers = const {},
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
  }) async {
    final apiClient = await ApiClient.create(
      headers: headers,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );

    if (apiClient == null) throw Exception('API Client is null');

    final raw = await request(apiClient);

    final response = ResponseParser.parse<List<T>>(raw, (dataObj) {
      if (T == int || T == double || T == String || T == bool) {
        return (dataObj as List).cast<T>();
      }
      return dataObj
          .map((e) => ModelRegistry.fromJson<T>(e))
          .toList()
          .cast<T>();
    });

    if (response.success == false) {
      throw Exception("API returned false");
    }

    if (response.data == null) {
      throw Exception("API returned null data for type $T");
    }

    if (response.token != null) {
      AuthController.instance.tokenManager.setToken(response.token);
    }

    return response.data as List<T>;
  }

  Future<void> fetchNonReturnable({
    required Future<dynamic> Function(ApiClient api) request,
    Map<String, dynamic> headers = const {},
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
  }) async {
    final apiClient = await ApiClient.create(
      headers: headers,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );

    if (apiClient == null) throw Exception('API Client is null');

    final raw = await request(apiClient);

    if (raw is Map<String, dynamic> && raw['success'] == false) {
      throw Exception("API returned false");
    }

    if (raw is Map<String, dynamic> && raw['token'] != null) {
      AuthController.instance.tokenManager.setToken(raw['token']);
    }
  }

  Future<void> downloadFileAndroid(String filePath) async {
    if (Platform.isAndroid) {
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        throw Exception('Storage permission ditolak');
      }
    }

    final downloader = await DownloadClient.create();
    if (downloader == null) {
      throw Exception('Downloader null');
    }

    final savedPath = await downloader.downloadFile(filePath);
    if (savedPath == null) {
      throw Exception('Download gagal');
    }

    debugPrint('Downloaded to $savedPath');
  }
}
