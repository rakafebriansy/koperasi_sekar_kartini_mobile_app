import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController phoneCtrl = TextEditingController(
    text: !kReleaseMode ? '08123456789' : ''
  );
  TextEditingController passwordCtrl = TextEditingController(
    text: !kReleaseMode ? 'password' : ''
  );

  ScrollController scrollController = ScrollController();
}
