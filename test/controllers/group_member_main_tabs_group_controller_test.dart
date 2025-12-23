import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/main/tabs/group/controllers/group_member_main_tabs_group_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:mocktail/mocktail.dart';

import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import '../mocks/mock_api_helper.dart';
import '../mocks/mock_auth_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockApiHelper mockApi;
  late GroupMemberMainTabsGroupController controller;

  final dummyGroup = DummyHelper.group(1);
  final dummyMember = DummyHelper.user(1);

  setUp(() {
    Get.reset();
    Get.testMode = true;
    mockApi = MockApiHelper();

    final mockAuth = MockAuthController();
    when(() => mockAuth.currentUser).thenReturn(
      DummyHelper.user(1).copyWith(groupId: dummyGroup.id),
    );

    controller = GroupMemberMainTabsGroupController(apiHelper: mockApi);
  });

  group('GroupMemberMainTabsGroupController', () {
    test('fetchGroupById updates group', () async {
      when(() => mockApi.fetch<GroupModel>(request: any(named: 'request')))
          .thenAnswer((_) async => dummyGroup);

      await controller.fetchGroupById(dummyGroup.id);

      expect(controller.isFetchingGroup, false);
      expect(controller.group?.id, dummyGroup.id);

      verify(() => mockApi.fetch<GroupModel>(request: any(named: 'request')))
          .called(1);
    });

    test('fetchListGroupMember updates group members', () async {
      when(() => mockApi.fetchList<UserModel>(request: any(named: 'request')))
          .thenAnswer((_) async => [dummyMember]);

      await controller.fetchListGroupMember(dummyGroup.id);

      expect(controller.isFetchingGroupMember, false);
      expect(controller.groupMembers.length, 1);
      expect(controller.groupMembers.first.name, dummyMember.name);

      verify(() =>
              mockApi.fetchList<UserModel>(request: any(named: 'request')))
          .called(1);
    });

    test('fetchGroupById handles API exception gracefully', () async {
      when(() => mockApi.fetch<GroupModel>(request: any(named: 'request')))
          .thenThrow(Exception('API Error'));

      await controller.fetchGroupById(dummyGroup.id);

      expect(controller.isFetchingGroup, false);
      expect(controller.group, null);
    });

    test('fetchListGroupMember handles API exception gracefully', () async {
      when(() => mockApi.fetchList<UserModel>(request: any(named: 'request')))
          .thenThrow(Exception('API Error'));

      await controller.fetchListGroupMember(dummyGroup.id);

      expect(controller.isFetchingGroupMember, false);
      expect(controller.groupMembers.isEmpty, true);
    });
  });
}
