import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/work_area_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';

class ManageGroupController extends GetxController {
  ScrollController scrollController = ScrollController();

  RxInt _selectedScreen = 0.obs;
  int get selectedScreen => _selectedScreen.value;

  @override
  void onClose() {
    numberCtrl.dispose();
    nameCtrl.dispose();
    regulationCtrl.dispose();
    scrollController.dispose();
    super.onClose();
  }

  void nextScreen() {
    _selectedScreen.value++;
  }

  void prevScreen() {
    _selectedScreen.value--;
  }

  TextEditingController nameCtrl = TextEditingController(
    // text: !kReleaseMode ? 'Raka Febrian' : '',
  );

  TextEditingController regulationCtrl = TextEditingController(
    // text: !kReleaseMode ? 'Lorem ipsum dolor sit amet' : '',
  );

  TextEditingController numberCtrl = TextEditingController(
    // text: !kReleaseMode ? '1' : '',
  );

  Rx<WorkAreaModel?> selectedWorkArea = Rx<WorkAreaModel?>(
    !kReleaseMode ? DummyHelper.dummyWorkAreas[0] : null,
  );

  Rx<UserModel?> selectedChairman = Rx<UserModel?>(
    !kReleaseMode ? DummyHelper.dummyUsers[0] : null,
  );

  Rx<UserModel?> selectedFacilitator = Rx<UserModel?>(
    !kReleaseMode ? DummyHelper.dummyUsers[1] : null,
  );

  RxString selectedStatus = RxString('Aktif');
}
