import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/work_area/work_area_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/string/string_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

class ManageGroupMemberProfileController extends GetxController {
  final firstFormKey = GlobalKey<FormState>();
  final secondFormKey = GlobalKey<FormState>();
  final thirdFormKey = GlobalKey<FormState>();
  final fourthFormKey = GlobalKey<FormState>();

  TextEditingController identityNumberCtrl = TextEditingController(
    // text: !kReleaseMode ? '1234567890123456' : '',
  );
  TextEditingController nameCtrl = TextEditingController(
    // text: !kReleaseMode ? 'Raka Febrian Syahputra' : '',
  );
  TextEditingController addressCtrl = TextEditingController(
    // text: !kReleaseMode ? 'lorem ipsum dolor sit amet' : '',
  );
  TextEditingController birthDateCtrl = TextEditingController(
    // text: !kReleaseMode ? '29/02/2004' : '',
  );
  TextEditingController occupationCtrl = TextEditingController(
    // text: !kReleaseMode ? 'Programmer' : '',
  );
  TextEditingController emailCtrl = TextEditingController(
    // text: !kReleaseMode ? 'raka@example.com' : '',
  );
  TextEditingController phoneCtrl = TextEditingController(
    // text: !kReleaseMode ? '08123456789' : '',
  );
  TextEditingController passwordCtrl = TextEditingController(
    // text: !kReleaseMode ? 'Password123' : '',
  );
  TextEditingController confirmPasswordCtrl = TextEditingController(
    // text: !kReleaseMode ? 'Password123' : '',
  );

  final RxInt _selectedScreen = 0.obs;
  int get selectedScreen => _selectedScreen.value;

  final RxBool _isSubmitted = false.obs;
  bool get isSubmitted => _isSubmitted.value;

  final RxBool _isFetchingWorkArea = false.obs;
  bool get isFetchingWorkArea => _isFetchingWorkArea.value;

  final Rx<File?> _idCardImage = Rxn();
  File? get idCardImage => _idCardImage.value;

  final Rx<File?> _selfImage = Rxn();
  File? get selfImage => _selfImage.value;

  final RxList<WorkAreaModel> _workAreas = RxList();
  List<WorkAreaModel>? get workAreas => _workAreas;

  final Rx<WorkAreaModel?> _selectedWorkArea = Rxn();
  WorkAreaModel? get selectedWorkArea => _selectedWorkArea.value;

  final Rx<UserModel?> _user = Rxn();
  UserModel? get user => _user.value;

  final Rx<ActionType?> _action = Rxn();
  ActionType? get action => _action.value;

  @override
  void onInit() {
    final args = (Get.arguments as ArgsWrapper);

    final user = args.data as UserModel;

    _user.value = user;
    identityNumberCtrl.text = user.identityNumber ?? '';
    nameCtrl.text = user.name;
    addressCtrl.text = user.address ?? '';
    birthDateCtrl.text = DateFormat('dd/MM/yyyy').format(user.birthDate!);
    occupationCtrl.text = user.occupation ?? '';
    phoneCtrl.text = user.phoneNumber;
    passwordCtrl.text = '';
    confirmPasswordCtrl.text = '';
    _selectedWorkArea.value = user.workArea;

    fetchListWorkArea();
    super.onInit();
  }

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
    super.dispose();
  }

  void nextScreen() {
    _selectedScreen.value++;
  }

  void prevScreen() {
    _selectedScreen.value--;
  }

  void selectMember(String? name) {
    if (name == null) return;

    _selectedWorkArea.value = _workAreas.firstWhere(
      (item) => item.name.toLowerCase() == name.toLowerCase(),
    );
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

  Future<void> fetchListWorkArea({String? search}) async {
    _isFetchingWorkArea.value = true;

    try {
      final List<WorkAreaModel> data = await ApiHelper.instance
          .fetchList<WorkAreaModel>(
            request: (api) => api.getWorkAreas(search: search),
          );

      _workAreas.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingWorkArea.value = false;
    }
  }

  Future<void> updateProfile() async {
    _isSubmitted.value = true;

    try {
      Get.back(result: true);
      Get.snackbar('INFO', 'Berhasil membuat akun!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e);
    } finally {
      _isSubmitted.value = false;
    }
  }

  Future<void> activateMember() async {
    //TODO: Apakah anda yakin?
    _isSubmitted.value = true;

    try {
      await ApiHelper.instance.fetch<UserModel>(
        request: (api) =>
            api.activateMember(id: user!.id, isActive: !(user!.isActive)),
      );

      Get.back(result: true);
      Get.snackbar('INFO', 'Berhasil mengubah aktivasi akun!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e);
    } finally {
      _isSubmitted.value = false;
    }
  }

  Future<void> submitButton() async {
    final role = AuthController.find.currentUser!.role;

    final steps = role == 'group_member'
        ? {
            0: () =>
                firstFormKey.currentState!.validate() ? nextScreen() : null,
            1: () =>
                secondFormKey.currentState!.validate() ? nextScreen() : null,
            2: () =>
                thirdFormKey.currentState!.validate() ? nextScreen() : null,
            3: () =>
                thirdFormKey.currentState!.validate() ? updateProfile() : null,
          }
        : {0: () => nextScreen(), 1: () => nextScreen(), 2: () => activateMember()};

    steps[selectedScreen]?.call();
  }
}
