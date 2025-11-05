import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/region_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/register/static/register_caption.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_constants.dart';

class RegisterController extends GetxController {
  TextEditingController regNumberCtrl = TextEditingController(
    text: !kReleaseMode ? '1234567890123456' : '',
  );
  TextEditingController nameCtrl = TextEditingController(
    text: !kReleaseMode ? 'Raka Febrian Syahputra' : '',
  );
  Rx<RegionModel?> selectedRegionModel = Rx<RegionModel?>(
    !kReleaseMode ? RegionModel(name: 'Sumbersari') : null,
  );
  TextEditingController addressCtrl = TextEditingController(
    text: !kReleaseMode ? 'lorem ipsum dolor sit amet' : '',
  );
  TextEditingController datetimeCtrl = TextEditingController(
    text: !kReleaseMode ? '29/02/2004' : '',
  );
  TextEditingController jobCtrl = TextEditingController(
    text: !kReleaseMode ? 'Programmer' : '',
  );
  TextEditingController emailCtrl = TextEditingController(
    text: !kReleaseMode ? 'raka@example.com' : '',
  );
  TextEditingController phoneCtrl = TextEditingController(
    text: !kReleaseMode ? '08123456789' : '',
  );
  TextEditingController passwordCtrl = TextEditingController(
    text: !kReleaseMode ? 'password' : '',
  );
  TextEditingController confirmPasswordCtrl = TextEditingController(
    text: !kReleaseMode ? 'password' : '',
  );

  final RxInt _selectedScreen = 0.obs;
  int get selectedScreen => _selectedScreen.value;

  final int totalStep = 5;
  double get progress => (selectedScreen + 1) / totalStep;

  ScrollController scrollController = ScrollController();

  List<RegionModel> regionModelData = [];
  late RegisterCaption caption;

  String get getCurrentTitle => caption.title[selectedScreen];
  String get getCurrentSubtitle => caption.subtitle[selectedScreen];

  Rx<File?> _idCardImage = Rxn();
  File? get idCardImage => _idCardImage.value;

  Rx<File?> _selfImage = Rxn();
  File? get selfImage => _selfImage.value;

  final ImagePicker _picker = ImagePicker();

  RegisterController({required this.caption});

  @override
  void onInit() {
    regionModelData = AppConstants.regionModelsFromApi;
    super.onInit();
  }

  @override
  void onClose() {
    regNumberCtrl.dispose();
    nameCtrl.dispose();
    addressCtrl.dispose();
    datetimeCtrl.dispose();
    jobCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    passwordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    scrollController.dispose();
    super.onClose();
  }

  void nextScreen() {
    _selectedScreen.value++;
  }

  void prevScreen() {
    _selectedScreen.value--;
  }

  Future<void> pickIdCardImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        _idCardImage.value = File(pickedFile.path);
      }
    } catch (e) {
      Get.snackbar('Gagal unggah gambar.', e.toString());
    }
  }

  Future<void> pickSelfImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        _selfImage.value = File(pickedFile.path);
      }
    } catch (e) {
      Get.snackbar('Gagal unggah gambar.', e.toString());
    }
  }
}
