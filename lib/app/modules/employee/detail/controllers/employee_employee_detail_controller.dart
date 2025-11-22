import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/data/wrapper/args_wrapper.dart';

class EmployeeEmployeeDetailController extends GetxController {
  final RxInt _selectedScreen = 0.obs;
  int get selectedScreen => _selectedScreen.value;

  ScrollController scrollController = ScrollController();

  Rx<int?> _id = Rxn();
  int? get id => _id.value;

  TextEditingController nationalIdCtrl = TextEditingController(
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
      final args = Get.arguments as ArgsWrapper;
      if (args.isUpdateAction) {
        final user = args.data as UserModel;

        final parsedDate = DateFormat('dd/MM/yyyy').format(user.birthDate);

        _id.value = user.id;
        nationalIdCtrl.text = user.nationalId;
        nameCtrl.text = user.name;
        phoneCtrl.text = user.phone;
        birthDateCtrl.text = parsedDate;
        addressCtrl.text = user.address;
        jobCtrl.text = user.job;
        emailCtrl.text = user.email ?? '';
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
