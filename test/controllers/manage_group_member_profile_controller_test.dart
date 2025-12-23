import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:mocktail/mocktail.dart';

import 'package:koperasi_sekar_kartini_mobile_app/app/modules/manage_group_member_profile/controllers/manage_group_member_profile_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/work_area/work_area_model.dart';

import '../mocks/mock_api_helper.dart';
import '../fakes/fake_auth_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ManageGroupMemberProfileController controller;

  late UserModel dummyUser;

  setUp(() {
    Get.reset();
    Get.testMode = true;

    dummyUser = DummyHelper.user(1);
    fakeAuth.currentUser = dummyUser;

    controller = ManageGroupMemberProfileController(
      apiHelper: mockApi,
      authController: fakeAuth,
    );
  });

  tearDown(() {
    Get.reset();
  });

  group('ManageGroupMemberProfileController', () {
    test('fetchListWorkArea success', () async {
      final workAreas = [
        WorkAreaModel(id: 1, name: 'Jakarta'),
        WorkAreaModel(id: 2, name: 'Bandung'),
      ];

      when(
        () => mockApi.fetchList<WorkAreaModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => workAreas);

      await controller.fetchListWorkArea();

      expect(controller.isFetchingWorkArea, false);
      expect(controller.workAreas, workAreas);
    });

    test('setIdCardImage sets file', () async {
      final file = File('dummy_id_card.png');

      await controller.setIdCardImage(file);

      expect(controller.idCardImage, file);
    });

    test('setSelfImage sets file', () async {
      final file = File('dummy_self.png');

      await controller.setSelfImage(file);

      expect(controller.selfImage, file);
    });

    test('nextScreen increments screen', () {
      expect(controller.selectedScreen, 0);
      controller.nextScreen();
      expect(controller.selectedScreen, 1);
    });

    test('prevScreen decrements screen', () {
      controller.nextScreen();
      controller.prevScreen();
      expect(controller.selectedScreen, 0);
    });

    test('activateMember calls API and updates state', () async {
      when(
        () => mockApi.fetch<UserModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => dummyUser);

      await controller.activateMember();

      expect(controller.isSubmitted, false);
      verify(
        () => mockApi.fetch<UserModel>(request: any(named: 'request')),
      ).called(1);
    });
  });
}
