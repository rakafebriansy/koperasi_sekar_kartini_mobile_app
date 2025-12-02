import 'dart:io';
import 'package:image_picker/image_picker.dart';

extension FileSizeExtension on File {
  Future<int> get sizeInBytes async => await length();

  Future<double> get sizeInKB async => (await length()) / 1024;

  Future<double> get sizeInMB async => (await length()) / (1024 * 1024);
}

extension XFileSizeExtension on XFile {
  Future<int> get sizeInBytes async => await length();

  Future<double> get sizeInKB async => (await length()) / 1024;

  Future<double> get sizeInMB async => (await length()) / (1024 * 1024);
}
