import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeEmployeeDetailController extends GetxController {
  final RxInt _selectedScreen = 0.obs;
  int get selectedScreen => _selectedScreen.value;

  ScrollController scrollController = ScrollController();

  TextEditingController regNumberCtrl = TextEditingController(
    text: !kReleaseMode ? '1234567890123456' : '',
  );
  TextEditingController nameCtrl = TextEditingController(
    text: !kReleaseMode ? 'Raka Febrian Syahputra' : '',
  );
    TextEditingController phoneCtrl = TextEditingController(
    text: !kReleaseMode ? '08123456789' : '',
  );
  TextEditingController datetimeCtrl = TextEditingController(
    text: !kReleaseMode ? '29/02/2004' : '',
  );
  TextEditingController addressCtrl = TextEditingController(
    text: !kReleaseMode ? 'lorem ipsum dolor sit amet' : '',
  );
  TextEditingController jobCtrl = TextEditingController(
    text: !kReleaseMode ? 'Resepsionis' : '',
  );
  TextEditingController emailCtrl = TextEditingController(
    text: !kReleaseMode ? 'raka@example.com' : '',
  );

  void nextScreen() {
    _selectedScreen.value++;
  }

  void prevScreen() {
    _selectedScreen.value--;
  }
}
