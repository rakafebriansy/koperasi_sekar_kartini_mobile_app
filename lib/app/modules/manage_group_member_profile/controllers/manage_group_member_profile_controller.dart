import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/work_area/work_area_model.dart';

class ManageGroupMemberProfileController extends GetxController {
  final firstFormKey = GlobalKey<FormState>();
  final secondFormKey = GlobalKey<FormState>();
  final thirdFormKey = GlobalKey<FormState>();
  final fourthFormKey = GlobalKey<FormState>();
  final fifthFormKey = GlobalKey<FormState>();

  TextEditingController identityNumberCtrl = TextEditingController(
    text: !kReleaseMode ? '1234567890123456' : '',
  );
  TextEditingController nameCtrl = TextEditingController(
    text: !kReleaseMode ? 'Raka Febrian Syahputra' : '',
  );
  TextEditingController addressCtrl = TextEditingController(
    text: !kReleaseMode ? 'lorem ipsum dolor sit amet' : '',
  );
  TextEditingController birthDateCtrl = TextEditingController(
    text: !kReleaseMode ? '29/02/2004' : '',
  );
  TextEditingController occupationCtrl = TextEditingController(
    text: !kReleaseMode ? 'Programmer' : '',
  );
  TextEditingController emailCtrl = TextEditingController(
    text: !kReleaseMode ? 'raka@example.com' : '',
  );
  TextEditingController phoneCtrl = TextEditingController(
    text: !kReleaseMode ? '08123456789' : '',
  );
  TextEditingController passwordCtrl = TextEditingController(
    text: !kReleaseMode ? 'Password123' : '',
  );
  TextEditingController confirmPasswordCtrl = TextEditingController(
    text: !kReleaseMode ? 'Password123' : '',
  );

  final RxInt _selectedScreen = 0.obs;
  int get selectedScreen => _selectedScreen.value;

  final RxBool _isSubmitted = false.obs;
  bool get isSubmitted => _isSubmitted.value;

  final Rx<File?> _idCardImage = Rxn();
  File? get idCardImage => _idCardImage.value;

  final Rx<File?> _selfImage = Rxn();
  File? get selfImage => _selfImage.value;

  Rx<WorkAreaModel?> selectedWorkArea = Rxn();
}
