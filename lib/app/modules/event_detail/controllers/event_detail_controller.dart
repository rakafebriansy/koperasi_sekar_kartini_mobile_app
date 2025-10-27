import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/event_attendance_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/event_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/types/enum/attendance_status_enum.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/types/enum/role_enum.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'dart:convert';

class EventDetailController extends GetxController {
  Rx<EventAttendanceModel?> eventAttendanceModel = Rx<EventAttendanceModel?>(
    null,
  );
  quill.QuillController? descriptionController = null;
  final descriptionFocusNode = FocusNode();
  final descriptionScrollController = ScrollController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    var event = EventModel(
      id: 'ID-KEGIATAN-1',
      name: 'Syukuran Rumah Baru Bu Nurul',
      description: '''
      [
        { "insert": "Rundown:\\n", "attributes": { "bold": true } },
        { "insert": "1. Pembukaan\\n2. Pembacaan Yasin\\n3. Ramah Tamah\\n4. Foto Bersama\\n5. Penutup\\n" },
        { "insert": "\\n" },
        { "insert": "Tempat:", "attributes": { "italic": true } },
        { "insert": " Rumah Bu Nurul\\n" }
      ]
    ''',
      dateTime: DateTime(2025, 11, 8, 20, 0, 0),
      location: 'Jl. Melati no.05, Kec. Patrang, Kab. Jember',
      user: UserModel(
        id: 'ID-USER-1',
        namaLengkap: 'Raka Febrian',
        role: RoleEnum.admin,
      ),
    );
    eventAttendanceModel.value = EventAttendanceModel(
      id: 'ID-KEHADIRAN-KEGIATAN-1',
      event: event,
      user: UserModel(
        id: 'ID-USER-2',
        namaLengkap: 'Yusrina Hirzi',
        role: RoleEnum.employee,
      ),
      attendance: AttendanceStatusEnum.attend,
    );

    final doc = quill.Document.fromJson(jsonDecode(event.description));
    descriptionController = quill.QuillController(
      document: doc,
      selection: const TextSelection.collapsed(offset: 0),
    );
    descriptionController?.readOnly = true;
  }
}
