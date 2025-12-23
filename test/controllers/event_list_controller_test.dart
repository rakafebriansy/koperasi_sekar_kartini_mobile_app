import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:mocktail/mocktail.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/event/event_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/event_list/controllers/event_list_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

class MockApiHelper extends Mock implements ApiHelper {}

void main() {
  late EventListController controller;
  late MockApiHelper mockApi;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() {
    Get.reset();
    Get.testMode = true;
    mockApi = MockApiHelper();
    controller = EventListController(apiHelper: mockApi);
  });

  group('EventListController', () {
    final mockEvents = [DummyHelper.ev(1), DummyHelper.ev(2)];

    test('fetchListEvent sets events and updates isFetchingEvents', () async {
      when(
        () => mockApi.fetchList<EventModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => mockEvents);

      expect(controller.isFetchingEvents, false);
      expect(controller.events, isEmpty);

      await controller.fetchListEvent();

      expect(controller.isFetchingEvents, false);
      expect(controller.events, mockEvents);
      verify(
        () => mockApi.fetchList<EventModel>(request: any(named: 'request')),
      ).called(1);
    });

    test('fetchListEvent handles exceptions gracefully', () async {
      when(
        () => mockApi.fetchList<EventModel>(request: any(named: 'request')),
      ).thenThrow(Exception('API Error'));

      expect(controller.isFetchingEvents, false);

      await controller.fetchListEvent();
      await Future.delayed(Duration.zero);

      expect(controller.isFetchingEvents, false);
      expect(controller.events, isEmpty);
    });

    test(
      'onSearchChanged calls fetchListEvent after debounce duration',
      () async {
        when(
          () => mockApi.fetchList<EventModel>(request: any(named: 'request')),
        ).thenAnswer((_) async => mockEvents);

        controller.onSearchChanged('test');

        await controller.fetchListEvent(search: 'test');

        expect(controller.events, mockEvents);
        verify(
          () => mockApi.fetchList<EventModel>(request: any(named: 'request')),
        ).called(1);
      },
    );
  });
}
