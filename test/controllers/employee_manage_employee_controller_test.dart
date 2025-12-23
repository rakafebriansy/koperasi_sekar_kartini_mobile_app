import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_employee/controllers/employee_manage_employee_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

void main() {
  late EmployeeManageEmployeeController controller;

  setUp(() {
    Get.reset();
    Get.testMode = true;
  });

  test('onInit → create action terset dengan benar', () {
    Get.arguments = ArgsWrapper(
      action: ActionType.create,
    );

    controller = EmployeeManageEmployeeController();
    controller.onInit();

    expect(controller.action, ActionType.create);
    expect(controller.id, null);
  });

  test('onInit → update action mengisi data user', () {
    final user = UserModel(
      id: 1,
      name: 'Raka',
      identityNumber: '123',
      phoneNumber: '08123',
      birthDate: DateTime(2000, 1, 1),
    );

    Get.arguments = ArgsWrapper(
      action: ActionType.update,
      data: user,
    );

    controller = EmployeeManageEmployeeController(apiHelper: mock);
    controller.onInit();

    expect(controller.action, ActionType.update);
    expect(controller.id, 1);
    expect(controller.nameCtrl.text, 'Raka');
  });

  test('nextScreen & prevScreen bekerja', () {
    controller = EmployeeManageEmployeeController();

    expect(controller.selectedScreen, 0);
    controller.nextScreen();
    expect(controller.selectedScreen, 1);
    controller.prevScreen();
    expect(controller.selectedScreen, 0);
  });

  test('setIdCardImage sukses', () async {
    controller = EmployeeManageEmployeeController();

    final file = File('dummy.png');
    await controller.setIdCardImage(file);

    expect(controller.idCardImage, file);
  });

  test('setIdCardImage null → tidak crash', () async {
    controller = EmployeeManageEmployeeController();

    await controller.setIdCardImage(null);

    expect(controller.idCardImage, null);
  });

  test('submitButton screen 0 → lanjut screen', () async {
    controller = EmployeeManageEmployeeController();

    // form dianggap valid
    controller.firstFormKey.currentState?.validate();

    await controller.submitButton();

    expect(controller.selectedScreen, 1);
  });

  test('submitButton screen 1 tanpa action → aman', () async {
    controller = EmployeeManageEmployeeController();

    controller.nextScreen(); // ke screen 1
    await controller.submitButton();

    expect(controller.isSubmitted, false);
  });
}
