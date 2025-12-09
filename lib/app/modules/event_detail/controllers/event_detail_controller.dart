import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/types/enum/attendance_status_enum.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'dart:convert';

import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';

class EventDetailController extends GetxController {
  quill.QuillController? descriptionController;
  final descriptionFocusNode = FocusNode();
  final descriptionScrollController = ScrollController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }
}
