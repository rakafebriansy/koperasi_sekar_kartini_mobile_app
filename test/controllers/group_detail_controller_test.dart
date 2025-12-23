import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_detail/controllers/group_detail_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:mocktail/mocktail.dart';

import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';

import '../fakes/fake_auth_controller.dart';
import '../mocks/mock_api_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late GroupDetailController controller;
  final dummyGroup = DummyHelper.group(1);
  final dummyEmployee = DummyHelper.user(1);
  final dummyMember = DummyHelper.inuser(2);

  setUp(() {
    Get.reset();
    Get.testMode = true;
    controller = GroupDetailController(
      apiHelper: mockApi,
      authController: Get.put(fakeAuth),
    );
  });

  group('GroupDetailController', () {
    test('fetchListEmployee updates employees list', () async {
      when(
        () => mockApi.fetchList<UserModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => [dummyEmployee]);

      await controller.fetchListEmployee();

      expect(controller.isFetchingEmployee, false);
      expect(controller.employees.length, 1);
      expect(controller.employees.first.name, dummyEmployee.name);
      verify(
        () => mockApi.fetchList<UserModel>(request: any(named: 'request')),
      ).called(1);
    });

    test('fetchGroupById updates group', () async {
      when(
        () => mockApi.fetch<GroupModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => dummyGroup);

      await controller.fetchGroupById(dummyGroup.id);

      expect(controller.isFetchingGroup, false);
      expect(controller.group?.id, dummyGroup.id);
      verify(
        () => mockApi.fetch<GroupModel>(request: any(named: 'request')),
      ).called(1);
    });

    test('fetchUnlistedMembers updates unlisted members', () async {
      when(
        () => mockApi.fetchList<UserModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => [dummyMember]);

      await controller.fetchUnlistedMembers(dummyGroup.workArea.id);

      expect(controller.isFetchingUnlistedMembers, false);
      expect(controller.unlistedMembers.length, 1);
      expect(controller.unlistedMembers.first.name, dummyMember.name);
      verify(
        () => mockApi.fetchList<UserModel>(request: any(named: 'request')),
      ).called(1);
    });

    test('fetchListGroupMember updates group members', () async {
      when(
        () => mockApi.fetchList<UserModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => [dummyMember]);

      await controller.fetchListGroupMember(dummyGroup.id);

      expect(controller.isFetchingGroupMember, false);
      expect(controller.groupMembers.length, 1);
      expect(controller.groupMembers.first.name, dummyMember.name);
      verify(
        () => mockApi.fetchList<UserModel>(request: any(named: 'request')),
      ).called(1);
    });

    test('addMember calls apiHelper.fetchNonReturnable', () async {
      controller.groupRx.value = dummyGroup;
      controller.selectedMemberRx.value = dummyMember;

      when(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).thenAnswer((_) async => Future<void>.value());
      when(
        () => mockApi.fetchList<UserModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => [dummyMember]);

      await controller.addMember();

      expect(controller.isSubmitted, false);
      verify(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).called(1);
    });

    test('updateChairman calls apiHelper.fetch', () async {
      controller.groupRx.value = dummyGroup;
      controller.selectedChairmanRx.value = dummyMember;

      when(
        () => mockApi.fetch<GroupModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => dummyGroup);

      await controller.updateChairman();

      expect(controller.isSubmitted, false);
      verify(
        () => mockApi.fetch<GroupModel>(request: any(named: 'request')),
      ).called(2);
    });

    test('updateFacilitator calls apiHelper.fetch', () async {
      controller.groupRx.value = dummyGroup;
      controller.selectedFacilitatorRx.value = dummyEmployee;

      when(
        () => mockApi.fetch<GroupModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => dummyGroup);

      await controller.updateFacilitator();

      expect(controller.isSubmitted, false);
      verify(
        () => mockApi.fetch<GroupModel>(request: any(named: 'request')),
      ).called(2);
    });

    test('changeFundAmount calls apiHelper.fetchNonReturnable', () async {
      controller.groupRx.value = dummyGroup;
      controller.selectedFundTypeRx.value = controller.fundTypes.first;
      controller.fundAmountCtrl.text = '50000';

      when(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).thenAnswer((_) async => Future<void>.value());
      when(
        () => mockApi.fetch<GroupModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => dummyGroup);

      await controller.changeFundAmount();

      expect(controller.isSubmitted, false);
      verify(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).called(1);
    });
  });
}
