import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

class EmployeeEmployeeDetailController extends GetxController {
  final RxInt _selectedScreen = 0.obs;
  int get selectedScreen => _selectedScreen.value;

  ScrollController scrollController = ScrollController();

  final Rx<int?> _id = Rxn();
  int? get id => _id.value;

  TextEditingController identityNumberCtrl = TextEditingController(
    // text: !kReleaseMode ? '1234567890123456' : '',
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
  TextEditingController jobCtrl = TextEditingController(
    // text: !kReleaseMode ? 'Resepsionis' : '',
  );
  TextEditingController emailCtrl = TextEditingController(
    // text: !kReleaseMode ? 'raka@example.com' : '',
  );

  @override
  void onInit() {
    try {
      final user = (Get.arguments as ArgsWrapper).data as UserModel;

      if ((Get.arguments as ArgsWrapper).isUpdateAction) {
        _id.value = user.id;
        birthDateCtrl.text = user.birthDate == null
            ? ''
            : DateFormat('dd/MM/yyyy').format(user.birthDate!);
        identityNumberCtrl.text = user.identityNumber ?? '';
        nameCtrl.text = user.name;
        phoneCtrl.text = user.phoneNumber ?? '';
        addressCtrl.text = user.address?? '';
        jobCtrl.text = user.occupation ?? '';
      }
    } catch (e) {
      print(e);
    }
    super.onInit();
  }

  void nextScreen() {
    _selectedScreen.value++;
  }

  void prevScreen() {
    _selectedScreen.value--;
  }
}
