import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/event_detail/controllers/event_detail_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:mocktail/mocktail.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../fakes/fake_auth_controller.dart';

class MockApiHelper extends Mock implements ApiHelper {}

void main() {
  late EventDetailController controller;
  late MockApiHelper mockApi;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() {
    Get.reset();
    Get.testMode = true;
    mockApi = MockApiHelper();

    controller = EventDetailController(
      apiHelper: mockApi,
            authController: Get.put(FakeAuthController(apiHelper: mockApi)),

    );

    controller.eventRx.value = DummyHelper.ev(1);
  });

  group('EventDetailController', () {
    test('deleteMeeting calls apiHelper.fetchNonReturnable', () async {
      when(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).thenAnswer((_) async => Future<void>.value());

      await controller.deleteMeeting();

      expect(controller.isSubmitted, false);
      verify(
        () => mockApi.fetchNonReturnable(request: any(named: 'request')),
      ).called(1);
    });
  });
}
