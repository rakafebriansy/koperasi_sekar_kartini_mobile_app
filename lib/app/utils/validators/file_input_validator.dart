import 'dart:io';

extension FileInputValidator on File? {
  String? isRequired(String fieldName) {
    if (this == null) return "$fieldName tidak boleh kosong";
    return null;
  }
}
