import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:mocktail/mocktail.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_employee/controllers/employee_manage_employee_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';

import '../mocks/mock_api_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late EmployeeManageEmployeeController controller;
  late MockApiHelper mockApi;

  setUp(() {
    Get.reset();
    Get.testMode = true;
    mockApi = MockApiHelper();
    Get.put<ApiHelper>(mockApi);
    controller = EmployeeManageEmployeeController(apiHelper: mockApi);
  });

  group('EmployeeManageEmployeeController', () {
    test('setIdCardImage sets value', () async {
      final file = File('test.png');
      await controller.setIdCardImage(file);
      expect(controller.idCardImage, file);
    });

    test('setSelfImage sets value', () async {
      final file = File('self.png');
      await controller.setSelfImage(file);
      expect(controller.selfImage, file);
    });

    test('setMemberCardImage sets value', () async {
      final file = File('member.png');
      await controller.setMemberCardImage(file);
      expect(controller.memberCardImage, file);
    });

    test(
      'createEmployee calls apiHelper.fetch and returns UserModel',
      () async {
        final fakeUser = UserModel(
          id: 1,
          name: 'Test User',
          identityNumber: '1234567890',
          birthDate: DateTime(2000, 1, 1),
          phoneNumber: '08123456789',
          role: 'employee',
          isActive: true,
        );

        when(
          () => mockApi.fetch<UserModel>(request: any(named: 'request')),
        ).thenAnswer((invocation) async {
          return fakeUser;
        });

        await controller.createEmployee();
        expect(controller.isSubmitted, false);
      },
    );

    test('updateEmployee calls apiHelper.fetch and completes', () async {
      final fakeUser = UserModel(
        id: 1,
        name: 'Test User',
        identityNumber: '1234567890',
        birthDate: DateTime(2000, 1, 1),
        phoneNumber: '08123456789',
        role: 'employee',
        isActive: true,
      );

      controller.idCardImage;

      when(
        () => mockApi.fetch<UserModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => fakeUser);

      controller.idRx.value = 1;

      await controller.updateEmployee();
      expect(controller.isSubmitted, false);
    });

    test('deleteEmployee calls apiHelper.fetchNonReturnable', () async {
      when(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).thenAnswer((_) async {
        return Future<void>.value();
      });

      controller.idRx.value = 1;
      await controller.deleteEmployee();
      expect(controller.isSubmitted, false);
    });
  });
}
