import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/register/controllers/register_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/register/static/register_caption.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:mocktail/mocktail.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/work_area/work_area_model.dart';
import '../mocks/mock_api_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late RegisterController controller;
  final dummyWorkArea = WorkAreaModel(id: 1, name: 'Work Area 1');
  final dummyUser = DummyHelper.user(1);
  final dummyCaption = RegisterCaption();

  setUp(() {
    Get.reset();
    Get.testMode = true;
    controller = RegisterController(apiHelper: mockApi, caption: dummyCaption);
  });

  group('RegisterController', () {
    test('fetchListWorkArea updates workAreas list', () async {
      when(
        () => mockApi.fetchList<WorkAreaModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => [dummyWorkArea]);

      await controller.fetchListWorkArea();

      expect(controller.isFetchingWorkArea, false);
      expect(controller.workAreas.length, 1);
      expect(controller.workAreas.first.name, dummyWorkArea.name);
      verify(
        () => mockApi.fetchList<WorkAreaModel>(request: any(named: 'request')),
      ).called(1);
    });

    test('selectMember sets selectedWorkArea correctly', () async {
      controller.workAreas.add(dummyWorkArea);

      controller.selectMember(dummyWorkArea.name);

      expect(controller.selectedWorkArea?.name, dummyWorkArea.name);
    });

    test('setIdCardImage sets image', () async {
      final file = File('dummy_id_card.png');
      await controller.setIdCardImage(file);
      expect(controller.idCardImage, file);
    });

    test('setSelfImage sets image', () async {
      final file = File('dummy_self.png');
      await controller.setSelfImage(file);
      expect(controller.selfImage, file);
    });

    test('register calls apiHelper.fetch and resets state', () async {
      controller.selectedWorkAreaRx.value = dummyWorkArea;
      controller.nameCtrl.text = 'Test Name';
      controller.identityNumberCtrl.text = '123456';
      controller.birthDateCtrl.text = '01/01/2000';
      controller.phoneCtrl.text = '08123456789';
      controller.addressCtrl.text = 'Address';
      controller.occupationCtrl.text = 'Job';
      controller.passwordCtrl.text = 'Password123';
      controller.idCardImageRx.value = File('id_card.png');
      controller.selfImageRx.value = File('self.png');

      when(
        () => mockApi.fetch<UserModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => dummyUser);

      await controller.register();

      expect(controller.isSubmitted, false);
      verify(
        () => mockApi.fetch<UserModel>(request: any(named: 'request')),
      ).called(1);
    });

    test('nextScreen and prevScreen update selectedScreen', () {
      final initial = controller.selectedScreen;
      controller.nextScreen();
      expect(controller.selectedScreen, initial + 1);
      controller.prevScreen();
      expect(controller.selectedScreen, initial);
    });

    test('progress is calculated correctly', () {
      controller.selectedScreenRx.value = 2;
      expect(controller.progress, (2 + 1) / controller.totalStep);
    });
  });
}
