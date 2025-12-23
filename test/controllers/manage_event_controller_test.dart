import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:mocktail/mocktail.dart';

import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/event/event_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/manage_event/controllers/manage_event_controller.dart';

import '../fakes/fake_auth_controller.dart';
import '../mocks/mock_api_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ManageEventController controller;

  setUp(() {
    Get.reset();
    Get.testMode = true;

    fakeAuth.currentUser = DummyHelper.user(1);

    controller = ManageEventController(
      apiHelper: mockApi,
      authController: fakeAuth as dynamic,
    );
  });

  tearDown(() {
    Get.reset();
  });

  test('fetchListGroup loads group list', () async {
    final groups = [DummyHelper.group(1), DummyHelper.group(2)];

    when(
      () => mockApi.fetchList<GroupModel>(request: any(named: 'request')),
    ).thenAnswer((_) async => groups);

    await controller.fetchListGroup();

    expect(controller.groups.length, 2);
    expect(controller.isFetching, false);
  });

  test('selectEventType sets selected event type', () {
    controller.selectEventType('Kelompok');

    expect(controller.selectedEventType, EventType.group);
  });

  test('createMeeting calls api and resets isSubmitted', () async {
    controller.selectEventType('Kelompok');
    controller.dateTimeCtrl.text = '08:00 29/02/2024';
    controller.nameCtrl.text = 'Meeting Test';
    controller.locationCtrl.text = 'Jember';

    when(
      () => mockApi.fetch<EventModel>(request: any(named: 'request')),
    ).thenAnswer((_) async => DummyHelper.ev(1));

    await controller.createMeeting();

    expect(controller.isSubmitted, false);

    verify(
      () => mockApi.fetch<EventModel>(request: any(named: 'request')),
    ).called(1);
  });

  test('createMeeting handles exception', () async {
    controller.selectEventType('Kelompok');
    controller.dateTimeCtrl.text = '08:00 29/02/2024';

    when(
      () => mockApi.fetch<EventModel>(request: any(named: 'request')),
    ).thenThrow(Exception('API Error'));

    await controller.createMeeting();

    expect(controller.isSubmitted, false);
  });

  test('submitButton triggers createMeeting', () async {
    controller.selectEventType('Kelompok');
    controller.dateTimeCtrl.text = '08:00 29/02/2024';

    when(
      () => mockApi.fetch<EventModel>(request: any(named: 'request')),
    ).thenAnswer((_) async => DummyHelper.ev(1));

    await controller.submitButton();

    expect(controller.isSubmitted, false);
  });
}
