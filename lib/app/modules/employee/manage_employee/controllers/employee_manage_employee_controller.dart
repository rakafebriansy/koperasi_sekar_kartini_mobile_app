import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/action_type/action_type_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/string/string_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/file_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

class EmployeeManageEmployeeController extends GetxController {
  final firstFormKey = GlobalKey<FormState>();
  final secondFormKey = GlobalKey<FormState>();

  TextEditingController identityNumberCtrl = TextEditingController(
    // text: !kReleaseMode ? '1234567890123456' : '',
  );
  TextEditingController memberNumberCtrl = TextEditingController(
    // text: !kReleaseMode ? '000001' : '',
  );
  TextEditingController nameCtrl = TextEditingController(
    // text: !kReleaseMode ? 'Raka Febrian Syahputra' : '',
  );
  TextEditingController phoneCtrl = TextEditingController(
    // text: !kReleaseMode ? '08123456789' : '',
  );
  TextEditingController birthDateCtrl = TextEditingController(
    // text: !kReleaseMode ? '29/02/2004' : '',
  );
  TextEditingController addressCtrl = TextEditingController(
    // text: !kReleaseMode ? 'lorem ipsum dolor sit amet' : '',
  );
  TextEditingController occupationCtrl = TextEditingController(
    // text: !kReleaseMode ? 'Resepsionis' : '',
  );
  TextEditingController emailCtrl = TextEditingController(
    // text: !kReleaseMode ? 'raka@example.com' : '',
  );
  TextEditingController passwordCtrl = TextEditingController(text: '12345678');

  final RxBool _isSubmitted = false.obs;
  bool get isSubmitted => _isSubmitted.value;

  final Rx<ActionType?> _action = Rxn();
  ActionType? get action => _action.value;

  final Rx<File?> _idCardImage = Rxn();
  File? get idCardImage => _idCardImage.value;

  final Rx<File?> _selfImage = Rxn();
  File? get selfImage => _selfImage.value;

  final RxInt _selectedScreen = 0.obs;
  int get selectedScreen => _selectedScreen.value;

  final Rx<int?> _id = Rxn();
  int? get id => _id.value;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    try {
      final args = (Get.arguments as ArgsWrapper);
      _action.value = args.action;

      if (args.action.isUpdateAction) {
        final user = args.data as UserModel;
        _id.value = user.id;
        birthDateCtrl.text = user.birthDate == null
            ? ''
            : DateFormat('dd/MM/yyyy').format(user.birthDate!);
        identityNumberCtrl.text = user.identityNumber ?? '';
        memberNumberCtrl.text = user.memberNumber ?? '';
        nameCtrl.text = user.name;
        phoneCtrl.text = user.phoneNumber ?? '';
        addressCtrl.text = user.address ?? '';
        occupationCtrl.text = user.occupation ?? '';
      }
    } catch (e) {
      ErrorHelper.handleError(e);
    }
    super.onInit();
  }

  @override
  void dispose() {
    identityNumberCtrl.dispose();
    memberNumberCtrl.dispose();
    nameCtrl.dispose();
    addressCtrl.dispose();
    birthDateCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    passwordCtrl.dispose();
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

  Future<void> createEmployee() async {
    _isSubmitted.value = true;

    try {
      await ApiHelper.fetch<UserModel>(
        request: (api) => api.createEmployee(
          name: nameCtrl.text.nullIfEmpty,
          identityNumber: identityNumberCtrl.text.nullIfEmpty,
          memberNumber: memberNumberCtrl.text.nullIfEmpty,
          birthDate: birthDateCtrl.text.nullIfEmpty,
          phoneNumber: phoneCtrl.text.nullIfEmpty,
          address: addressCtrl.text.nullIfEmpty,
          occupation: occupationCtrl.text.nullIfEmpty,
          password: passwordCtrl.text.nullIfEmpty,
          identityCardPhoto: idCardImage,
          selfPhoto: selfImage,
        ),
      );

      Get.back(result: true);
      Get.snackbar('INFO', 'Berhasil membuat akun!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e, canUseNavigator: false);
    } finally {
      _isSubmitted.value = false;
    }
  }

  Future<void> updateEmployee() async {
    _isSubmitted.value = true;

    if (id == null) throw Exception('id is null');

    try {
      await ApiHelper.fetch<UserModel>(
        request: (api) => api.updateEmployee(
          id: id!,
          name: nameCtrl.text,
          identityNumber: identityNumberCtrl.text,
          memberNumber: memberNumberCtrl.text,
          birthDate: birthDateCtrl.text.toIsoDateString(),
          phoneNumber: phoneCtrl.text,
          address: addressCtrl.text,
          occupation: occupationCtrl.text,
          password: passwordCtrl.text,
          identityCardPhoto: idCardImage,
          selfPhoto: selfImage,
        ),
      );

      Get.back(result: true);
      Get.snackbar('INFO', 'Berhasil memperbarui akun!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e, canUseNavigator: false);
    } finally {
      _isSubmitted.value = false;
    }
  }

  Future<void> deleteEmployee() async {
    _isSubmitted.value = true;

    if (id == null) {
      throw Exception('id is null');
    }

    try {
      await ApiHelper.fetchNonReturnable(
        request: (api) => api.deleteEmployee(id: id!),
      );

      Get.back(result: true);
      Get.snackbar('INFO', 'Berhasil menghapus akun!');
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
          try {
            if (action != null) {
              if (action!.isCreateAction) {
                if (idCardImage == null || selfImage == null) {
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
                }
                createEmployee();
              }
              if (action!.isUpdateAction) updateEmployee();
            }
          } catch (e) {
            ErrorHelper.handleError(e);
          }
        }
        return;
    }
  }
}
