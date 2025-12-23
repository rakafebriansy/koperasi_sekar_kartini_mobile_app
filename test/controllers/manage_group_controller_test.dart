import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:mocktail/mocktail.dart';

import 'package:koperasi_sekar_kartini_mobile_app/app/modules/manage_group/controllers/manage_group_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/work_area/work_area_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';

import '../mocks/mock_api_helper.dart';
import '../fakes/fake_auth_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ManageGroupController controller;

  setUp(() {
    Get.reset();
    Get.testMode = true;

    controller = ManageGroupController(
      apiHelper: mockApi,
      authController: fakeAuth,
    );
  });

  tearDown(() {
    Get.reset();
  });

  group('ManageGroupController', () {
    test('fetchListWorkArea success', () async {
      final workAreas = [WorkAreaModel(id: 1, name: 'Jakarta')];

      when(
        () => mockApi.fetchList<WorkAreaModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => workAreas);

      await controller.fetchListWorkArea();

      expect(controller.isFetchingWorkArea, false);
      expect(controller.workAreas, workAreas);

      verify(
        () => mockApi.fetchList<WorkAreaModel>(request: any(named: 'request')),
      ).called(1);
    });

    test('fetchListEmployee success', () async {
      final employees = [DummyHelper.user(1)];

      when(
        () => mockApi.fetchList<UserModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => employees);

      await controller.fetchListEmployee();

      expect(controller.isFetchingEmployee, false);
      expect(controller.employees, employees);
    });

    test('fetchListGroupMember success', () async {
      final members = [DummyHelper.user(1)];

      when(
        () => mockApi.fetchList<UserModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => members);

      await controller.fetchListGroupMember();

      expect(controller.isFetchingMember, false);
      expect(controller.members, members);
    });

    test('createGroup success', () async {
      when(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).thenAnswer((_) async {});

      controller.numberCtrl.text = '1';
      controller.descCtrl.text = 'Kelompok A';

      await controller.createGroup();

      expect(controller.isSubmitted, false);
      verify(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).called(1);
    });

    test('updateGroup success', () async {
      controller
        ..numberCtrl.text = '2'
        ..descCtrl.text = 'Update'
        ..idRx.value = 1;

      when(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).thenAnswer((_) async {});

      await controller.updateGroup();

      expect(controller.isSubmitted, false);
    });

    test('deleteGroup success', () async {
      controller.idRx.value = 1;

      when(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).thenAnswer((_) async {});

      await controller.deleteGroup();

      expect(controller.isSubmitted, false);
    });
  });
}
