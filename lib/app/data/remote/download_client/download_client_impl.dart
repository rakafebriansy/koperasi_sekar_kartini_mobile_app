import 'dart:io';
import 'package:dio/dio.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_constant.dart';
import 'package:permission_handler/permission_handler.dart';
import 'download_client.dart';

class DownloadClientImpl extends DownloadClient {
  DownloadClientImpl(super.dio, {required super.baseUrl});

  @override
  Future<String?> downloadFile(String path) async {
    final url = "$baseUrl/download/$path";

    print(url);

    final perm = await Permission.storage.request();
    if (!perm.isGranted) return null;

    final downloadsDir = Directory(LOCAL_DOWNLOAD_PATH);

    if (!await downloadsDir.exists()) {
      await downloadsDir.create(recursive: true);
    }

    final fileName = path.split('/').last;
    final savePath = '${downloadsDir.path}/$fileName';

    try {
      await dio.download(
        url,
        savePath,
        options: Options(responseType: ResponseType.bytes),
      );
      return savePath;
    } catch (e) {
      return null;
    }
  }
}
