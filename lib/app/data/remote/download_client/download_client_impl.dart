import 'package:path_provider/path_provider.dart';
import 'download_client.dart';

class DownloadClientImpl extends DownloadClient {
  DownloadClientImpl(super.dio, {required super.baseUrl});

  @override
  Future<String> downloadFile(String path) async {
    final encodedPath = Uri.encodeComponent(path);
    final url = "$baseUrl/download/$encodedPath";

    final dir = await getExternalStorageDirectory();
    if (dir == null) {
      throw Exception('External storage tidak tersedia');
    }

    final fileName = path.split('/').last;
    final savePath = '${dir.path}/$fileName';

    await dio.download(url, savePath);

    return savePath;
  }
}
