import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/region_model.dart';
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
  DateTime? birthDate = !kReleaseMode ? DateTime(2004, 2, 29) : null;
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

  Rx<int> selectedScreen = 0.obs;
  ScrollController scrollController = ScrollController();

  List<RegionModel> regionModelData = [];

  @override
  void onInit() {
    regionModelData = AppConstants.regionModelsFromApi;
    super.onInit();
  }
}
