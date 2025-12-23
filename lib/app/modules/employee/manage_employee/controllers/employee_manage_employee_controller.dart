import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/action_type/action_type_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/string/string_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

class EmployeeManageEmployeeController extends GetxController {
  final ApiHelper apiHelper;

  EmployeeManageEmployeeController({required this.apiHelper});

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
  TextEditingController passwordCtrl = TextEditingController(text: 'password');

  final RxBool _isSubmitted = false.obs;
  bool get isSubmitted => _isSubmitted.value;

  final Rx<ActionType?> _action = Rxn();
  ActionType? get action => _action.value;

  final Rx<File?> _idCardImage = Rxn();
  File? get idCardImage => _idCardImage.value;

  final Rx<File?> _selfImage = Rxn();
  File? get selfImage => _selfImage.value;

  final Rx<File?> _memberCardImage = Rxn();
  File? get memberCardImage => _memberCardImage.value;

  final RxInt _selectedScreen = 0.obs;
  int get selectedScreen => _selectedScreen.value;

  final Rx<int?> _id = Rxn();
  int? get id => _id.value;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    try {
      final args = (Get.arguments as ArgsWrapper);
      if (args.action == null) throw Exception('action is null');

      _action.value = args.action;

      if (args.action!.isUpdateAction) {
        final user = args.data as UserModel;
        _id.value = user.id;
        birthDateCtrl.text = DateFormat('dd/MM/yyyy').format(user.birthDate);
        identityNumberCtrl.text = user.identityNumber;
        memberNumberCtrl.text = user.memberNumber ?? '';
        nameCtrl.text = user.name;
        phoneCtrl.text = user.phoneNumber;
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

  Future<void> setMemberCardImage(File? file) async {
    try {
      if (file == null) throw Exception('Gambar kosong.');
      _memberCardImage.value = file;
    } catch (e) {
      ErrorHelper.handleError('Gagal unggah gambar: ${e.toString()}');
    }
  }

  Future<void> createEmployee() async {
    _isSubmitted.value = true;

    try {
      await apiHelper.fetch<UserModel>(
        request: (api) => api.createUser(
          name: nameCtrl.text.nullIfEmpty,
          identityNumber: identityNumberCtrl.text.nullIfEmpty,
          memberNumber: memberNumberCtrl.text.nullIfEmpty,
          birthDate: birthDateCtrl.text.isNotEmpty
              ? birthDateCtrl.text.toIsoDateString()
              : null,
          phoneNumber: phoneCtrl.text.nullIfEmpty,
          address: addressCtrl.text.nullIfEmpty,
          occupation: occupationCtrl.text.nullIfEmpty,
          password: passwordCtrl.text.nullIfEmpty,
          identityCardPhoto: idCardImage,
          selfPhoto: selfImage,
          role: 'employee',
          memberCardPhoto: memberCardImage,
        ),
      );

      Get.back(result: true);
      showSnackbar('INFO', 'Berhasil membuat akun!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e);
    } finally {
      _isSubmitted.value = false;
    }
  }

  Future<void> updateEmployee() async {
    _isSubmitted.value = true;

    if (id == null) throw Exception('id is null');

    try {
      await apiHelper.fetch<UserModel>(
        request: (api) => api.updateUser(
          id: id!,
          name: nameCtrl.text.nullIfEmpty,
          identityNumber: identityNumberCtrl.text.nullIfEmpty,
          memberNumber: memberNumberCtrl.text.nullIfEmpty,
          birthDate: birthDateCtrl.text.isNotEmpty
              ? birthDateCtrl.text.toIsoDateString()
              : null,
          phoneNumber: phoneCtrl.text.nullIfEmpty,
          address: addressCtrl.text.nullIfEmpty,
          occupation: occupationCtrl.text.nullIfEmpty,
          password: passwordCtrl.text.nullIfEmpty,
          role: 'employee',
          identityCardPhoto: idCardImage,
          selfPhoto: selfImage,
          memberCardPhoto: memberCardImage,
        ),
      );

      Get.back(result: true);
      showSnackbar('INFO', 'Berhasil memperbarui akun!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e);
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
      await apiHelper.fetchNonReturnable(
        request: (api) => api.deleteUser(id: id!),
      );

      Get.back(result: true);
      showSnackbar('INFO', 'Berhasil menghapus akun!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e);
    } finally {
      _isSubmitted.value = false;
    }
  }

  Future<void> submitButton() async {
    switch (selectedScreen) {
      case 0:
        if (!(firstFormKey.currentState?.validate() ?? true)) return;
        nextScreen();
        return;
      case 1:
        if (!(secondFormKey.currentState?.validate() ?? true)) return;
        try {
          if (action != null) {
            if (action!.isCreateAction) createEmployee();
            if (action!.isUpdateAction) updateEmployee();
          }
        } catch (e) {
          ErrorHelper.handleError(e);
        }
    }
    return;
  }
}
