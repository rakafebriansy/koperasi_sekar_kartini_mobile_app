import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/main/tabs/profile/controllers/group_member_main_tabs_profile_controller.dart';
import 'package:mocktail/mocktail.dart';

import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';

import '../mocks/mock_api_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockApiHelper mockApi;
  late GroupMemberMainTabsProfileController controller;

  setUp(() {
    Get.reset();
    Get.testMode = true;
    mockApi = MockApiHelper();
    controller = GroupMemberMainTabsProfileController(apiHelper: mockApi);
  });

  test('fetchListMember sukses → members terisi', () async {
    when(
      () => mockApi.fetchList<UserModel>(request: any(named: 'request')),
    ).thenAnswer((_) async => [DummyHelper.user(1), DummyHelper.user(2)]);

    await controller.fetchListMember();

    expect(controller.isFetchingMembers, false);
    expect(controller.members.length, 2);
  });

  test('fetchListMember gagal → members kosong', () async {
    when(
      () => mockApi.fetchList<UserModel>(request: any(named: 'request')),
    ).thenThrow(Exception('API Error'));

    await controller.fetchListMember();

    expect(controller.isFetchingMembers, false);
    expect(controller.members.isEmpty, true);
  });

  test('selectMember memilih member berdasarkan nama', () async {
    controller.members.addAll([DummyHelper.user(1), DummyHelper.user(2)]);

    controller.selectMember(DummyHelper.user(1).name);

    expect(controller.selectedMember, isNotNull);
    expect(controller.selectedMember!.id, DummyHelper.user(1).id);
  });

  test('setMemberCardImage sukses menyimpan file', () async {
    final file = File('dummy.png');

    await controller.setMemberCardImage(file);

    expect(controller.memberCardImage, file);
  });

  test('setMemberCardImage null → tidak crash', () async {
    await controller.setMemberCardImage(null);

    expect(controller.memberCardImage, null);
  });

  test('updateMemberCardImage sukses → reset state', () async {
    controller.members.add(DummyHelper.user(1));
    controller.selectMember(DummyHelper.user(1).name);
    controller.setMemberCardImage(File('dummy.png'));

    controller.formKey.currentState?.reset();

    when(
      () => mockApi.fetch<UserModel>(request: any(named: 'request')),
    ).thenAnswer((_) async => DummyHelper.user(1));

    await controller.updateMemberCardImage();

    expect(controller.isSubmitted, false);
    expect(controller.selectedMember, null);
    expect(controller.memberCardImage, null);
  });

  test('updateMemberCardImage gagal → reset state', () async {
    controller.members.add(DummyHelper.user(1));
    controller.selectMember(DummyHelper.user(1).name);
    controller.setMemberCardImage(File('dummy.png'));

    when(
      () => mockApi.fetch<UserModel>(request: any(named: 'request')),
    ).thenThrow(Exception('API Error'));

    await controller.updateMemberCardImage();

    expect(controller.isSubmitted, false);
    expect(controller.selectedMember, null);
    expect(controller.memberCardImage, null);
  });
}
