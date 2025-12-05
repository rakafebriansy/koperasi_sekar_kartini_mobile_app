import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/work_area/work_area_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/register/static/register_caption.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/string/string_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/file_input_validator.dart';

class RegisterController extends GetxController {
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

  final int totalStep = 5;
  double get progress => (selectedScreen + 1) / totalStep;

  ScrollController scrollController = ScrollController();

  late RegisterCaption caption;

  String get getCurrentTitle => caption.title[selectedScreen];
  String get getCurrentSubtitle => caption.subtitle[selectedScreen];

  Rx<WorkAreaModel?> selectedWorkArea = Rx<WorkAreaModel?>(
    !kReleaseMode
        ? WorkAreaModel(id: 1, name: DummyHelper.workAreas.first.name)
        : null,
  );

  RegisterController({required this.caption});

  @override
  void dispose() {
    identityNumberCtrl.dispose();
    nameCtrl.dispose();
    addressCtrl.dispose();
    birthDateCtrl.dispose();
    occupationCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    passwordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void nextScreen() {
    _selectedScreen.value++;
  }

  void prevScreen() {
    _selectedScreen.value--;
  }

  Future<void> setIdCardImage(File? file) async {
    try {
      if (file == null) throw Exception('Gambar kosong.');
      _idCardImage.value = file;
    } catch (e) {
      ErrorHelper.handleError('Gagal unggah gambar: ${e.toString()}');
    }
  }

  Future<void> setSelfImage(File? file) async {
    try {
      if (file == null) throw Exception('Gambar kosong.');
      _selfImage.value = file;
    } catch (e) {
      ErrorHelper.handleError('Gagal unggah gambar: ${e.toString()}');
    }
  }

  Future<void> register() async {
    _isSubmitted.value = true;

    if (selectedWorkArea.value == null) throw Exception('Work Area is null');

    try {
      await ApiHelper.fetch<UserModel>(
        request: (api) => api.register(
          name: nameCtrl.text,
          identityNumber: identityNumberCtrl.text,
          birthDate: birthDateCtrl.text.toIsoDateString(),
          phoneNumber: phoneCtrl.text,
          address: addressCtrl.text,
          occupation: occupationCtrl.text,
          password: passwordCtrl.text,
          workAreaId: selectedWorkArea.value!.id,
          identityCardPhoto: idCardImage!,
          selfPhoto: selfImage!,
        ),
      );

      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar('INFO', 'Berhasil membuat akun!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e, canUseNavigator: false);
    } finally {
      _isSubmitted.value = false;
    }
  }

  Future<void> submitButton() async {
    switch (selectedScreen) {
      case 0:
        if (firstFormKey.currentState!.validate()) {
          nextScreen();
        }
        return;
      case 1:
        if (secondFormKey.currentState!.validate()) {
          nextScreen();
        }
        return;
      case 2:
        if (thirdFormKey.currentState!.validate()) {
          nextScreen();
        }
        return;
      case 3:
        if (fourthFormKey.currentState!.validate()) {
          nextScreen();
        }
        return;
      case 4:
        if (fifthFormKey.currentState!.validate()) {
          try {
            var error = await idCardImage.maxSize(
              maxInMB: 2,
              fieldName: 'Foto KTP',
            );
            if (error != null) {
              throw Exception(error);
            }

            var error2 = await selfImage.maxSize(
              maxInMB: 2,
              fieldName: 'Foto KTP',
            );
            if (error2 != null) {
              throw Exception(error2);
            }

            register();
          } catch (e) {
            ErrorHelper.handleError(e);
          }
        }
        return;
    }
  }
}
