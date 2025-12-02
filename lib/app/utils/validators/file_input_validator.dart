import 'dart:io';

extension FileInputValidator on File? {
  String? isRequired(String fieldName) {
    if (this == null) return "$fieldName tidak boleh kosong";
    return null;
  }

  Future<String?> maxSize({
    double maxInMB = 2,
    String fieldName = "File",
  }) async {
    if (this == null) return null;
    int sizeInBytes = await this!.length();
    double sizeInMB = sizeInBytes / (1024 * 1024);
    if (sizeInMB > maxInMB) {
      return "$fieldName maksimal ${maxInMB.toStringAsFixed(0)} MB";
    }
    return null;
  }
}
