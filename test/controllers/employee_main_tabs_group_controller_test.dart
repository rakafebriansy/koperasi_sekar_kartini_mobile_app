import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';

import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/main/tabs/group/controllers/employee_main_tabs_group_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';

import '../mocks/mock_api_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();


  setUp(() {
    Get.reset();
    Get.testMode = true;
  });

  test("fetchListGroup mengambil daftar group dan mengisi state", () async {
    when(
      () => mockApi.fetchList<GroupModel>(request: any(named: 'request')),
    ).thenAnswer((_) async => [DummyHelper.group(1)]);

    final controller = EmployeeMainTabsGroupController(apiHelper: mockApi);
    await controller.fetchListGroup();

    await Future.delayed(Duration.zero);

    expect(controller.isFetchingGroup, false);
    expect(controller.groups.length, 1);
    expect(controller.groups.first.number, DummyHelper.group(1).number);
  });

  test(
    "fetchListVerifiedMember mengambil anggota aktif dan mengisi state",
    () async {
      when(
        () => mockApi.fetchList<UserModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => [DummyHelper.user(1)]);

      final controller = EmployeeMainTabsGroupController(apiHelper: mockApi);
      await controller.fetchListVerifiedMember();

      await Future.delayed(Duration.zero);

      expect(controller.isFetchingVerifiedMember, false);
      expect(controller.verifiedMembers.length, 1);
      expect(controller.verifiedMembers.first.name, DummyHelper.user(1).name);
    },
  );

  test(
    "fetchListInactiveMember mengambil anggota nonaktif dan mengisi state",
    () async {
      when(
        () => mockApi.fetchList<UserModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => [DummyHelper.inuser(3)]);

      final controller = EmployeeMainTabsGroupController(apiHelper: mockApi);
      controller.fetchListInactiveMember();

      await Future.delayed(Duration.zero);

      expect(controller.isFetchingInactiveMember, false);
      expect(controller.inactiveMembers.length, 1);
      expect(controller.inactiveMembers.first.name, DummyHelper.inuser(3).name);
    },
  );

  test(
    "fetchListGroup gagal → isFetchingGroup false dan data tetap kosong",
    () async {
      when(
        () => mockApi.fetchList<GroupModel>(request: any(named: 'request')),
      ).thenThrow(Exception('API Error'));

      final controller = EmployeeMainTabsGroupController(apiHelper: mockApi);
      await controller.fetchListGroup();

      await Future.delayed(Duration.zero);

      expect(controller.isFetchingGroup, false);
      expect(controller.groups.isEmpty, true);
    },
  );

  test(
    "fetchListVerifiedMember gagal → isFetchingVerifiedMember false dan data kosong",
    () async {
      when(
        () => mockApi.fetchList<UserModel>(request: any(named: 'request')),
      ).thenThrow(Exception('API Error'));

      final controller = EmployeeMainTabsGroupController(apiHelper: mockApi);
      await controller.fetchListVerifiedMember();

      await Future.delayed(Duration.zero);

      expect(controller.isFetchingVerifiedMember, false);
      expect(controller.verifiedMembers.isEmpty, true);
    },
  );

  test(
    "fetchListInactiveMember gagal → isFetchingInactiveMember false dan data kosong",
    () async {
      when(
        () => mockApi.fetchList<UserModel>(request: any(named: 'request')),
      ).thenThrow(Exception('API Error'));

      final controller = EmployeeMainTabsGroupController(apiHelper: mockApi);
      controller.fetchListInactiveMember();

      await Future.delayed(Duration.zero);

      expect(controller.isFetchingInactiveMember, false);
      expect(controller.inactiveMembers.isEmpty, true);
    },
  );
}
