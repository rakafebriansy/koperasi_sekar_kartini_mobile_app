import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/event_attendance_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/types/enum/attendance_status_enum.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'dart:convert';

import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';

class EventDetailController extends GetxController {
  Rx<EventAttendanceModel?> _eventAttendanceModel = Rxn();
  EventAttendanceModel? get eventAttendanceModel => _eventAttendanceModel.value;
  quill.QuillController? descriptionController = null;
  final descriptionFocusNode = FocusNode();
  final descriptionScrollController = ScrollController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    var event = DummyHelper.dummyEvents[5];
    _eventAttendanceModel.value = EventAttendanceModel(
      id: 1,
      event: event,
      user: DummyHelper.dummyUsers[0],
      attendance: AttendanceStatusEnum.attend,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final doc = quill.Document.fromJson(jsonDecode(event.description));
    descriptionController = quill.QuillController(
      document: doc,
      selection: const TextSelection.collapsed(offset: 0),
    );
    descriptionController?.readOnly = true;
  }
}
