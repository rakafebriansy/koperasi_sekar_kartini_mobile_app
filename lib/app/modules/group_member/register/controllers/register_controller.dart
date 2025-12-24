import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/work_area/work_area_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/register/static/register_caption.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/string/string_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';

class RegisterController extends GetxController {
  final ApiHelper apiHelper;

  RegisterController({required this.apiHelper, required this.caption});

  final firstFormKey = GlobalKey<FormState>();
  final secondFormKey = GlobalKey<FormState>();
  final thirdFormKey = GlobalKey<FormState>();
  final fourthFormKey = GlobalKey<FormState>();
  final fifthFormKey = GlobalKey<FormState>();

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
  RxInt get selectedScreenRx => _selectedScreen;
  int get selectedScreen => _selectedScreen.value;

  final RxBool _isSubmitted = false.obs;
  bool get isSubmitted => _isSubmitted.value;

  final RxBool _isFetchingWorkArea = false.obs;
  bool get isFetchingWorkArea => _isFetchingWorkArea.value;

  final RxList<WorkAreaModel> _workAreas = RxList();
  List<WorkAreaModel> get workAreas => _workAreas;

  final Rx<WorkAreaModel?> _selectedWorkArea = Rxn();
  Rx<WorkAreaModel?> get selectedWorkAreaRx => _selectedWorkArea;
  WorkAreaModel? get selectedWorkArea => _selectedWorkArea.value;

  final Rx<File?> _idCardImage = Rxn();
  Rx<File?> get idCardImageRx => _idCardImage;
  File? get idCardImage => _idCardImage.value;

  final Rx<File?> _selfImage = Rxn();
  Rx<File?> get selfImageRx => _selfImage;
  File? get selfImage => _selfImage.value;

  final int totalStep = 5;
  double get progress => (selectedScreen + 1) / totalStep;

  ScrollController scrollController = ScrollController();

  late RegisterCaption caption;

  String get getCurrentTitle => caption.title[selectedScreen];
  String get getCurrentSubtitle => caption.subtitle[selectedScreen];

  @override
  void onInit() {
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
      final List<WorkAreaModel> data = await apiHelper.fetchList<WorkAreaModel>(
        request: (api) => api.getWorkAreas(search: search),
      );

      _workAreas.value = data;
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingWorkArea.value = false;
    }
  }

  Future<void> register() async {
    _isSubmitted.value = true;

    if (selectedWorkArea == null) throw Exception('Work Area is null');

    try {
      await apiHelper.fetch<UserModel>(
        request: (api) => api.register(
          name: nameCtrl.text,
          identityNumber: identityNumberCtrl.text,
          birthDate: birthDateCtrl.text.toIsoDateString(),
          phoneNumber: phoneCtrl.text,
          address: addressCtrl.text,
          occupation: occupationCtrl.text,
          password: passwordCtrl.text,
          workAreaId: selectedWorkArea!.id,
          identityCardPhoto: idCardImage!,
          selfPhoto: selfImage!,
        ),
      );

      Get.offAllNamed(Routes.LOGIN);
      showSnackbar('INFO', 'Berhasil membuat akun!');
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
        if (!(firstFormKey.currentState?.validate() ?? true)) return;
        nextScreen();
        return;
      case 1:
        if (!(secondFormKey.currentState?.validate() ?? true)) return;
        nextScreen();
        return;
      case 2:
        if (!(thirdFormKey.currentState?.validate() ?? true)) return;
        nextScreen();
        return;
      case 3:
        if (!(fourthFormKey.currentState?.validate() ?? true)) return;
        nextScreen();
        return;
      case 4:
        if (!(fifthFormKey.currentState?.validate() ?? true)) return;
        register();
        return;
    }
  }
}
