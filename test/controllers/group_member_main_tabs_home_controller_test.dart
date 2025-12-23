import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/group_member/main/tabs/home/controllers/group_member_main_tabs_home_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart' as dio;

import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/event/event_model.dart';
import '../mocks/mock_api_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late GroupMemberMainTabsHomeController controller;

  setUp(() {
    Get.reset();
    Get.testMode = true;
    controller = GroupMemberMainTabsHomeController(apiHelper: mockApi);
  });

  group('GroupMemberMainTabsHomeController', () {
    final dummyEvent = DummyHelper.ev(1);

    test('fetchListEvent updates events list', () async {
      when(() => mockApi.fetchList<EventModel>(request: any(named: 'request')))
          .thenAnswer((_) async => [dummyEvent]);

      await controller.fetchListEvent();

      expect(controller.isFetchingEvents, false);
      expect(controller.events.length, 1);
      expect(controller.events.first.id, dummyEvent.id);
      verify(() => mockApi.fetchList<EventModel>(request: any(named: 'request')))
          .called(1);
    });

    test('fetchUpcomingEvents updates upcomingEvents list', () async {
      when(() => mockApi.fetchList<EventModel>(request: any(named: 'request')))
          .thenAnswer((_) async => [dummyEvent]);

      await controller.fetchUpcomingEvents();

      expect(controller.isFetchingUpcomingEvents, false);
      expect(controller.upcomingEvents.length, 1);
      expect(controller.upcomingEvents.first.id, dummyEvent.id);
      verify(() => mockApi.fetchList<EventModel>(request: any(named: 'request')))
          .called(1);
    });

    test('fetchLoanSumByMonth updates countLoan', () async {
      when(() => mockApi.fetch<int>(request: any(named: 'request')))
          .thenAnswer((_) async => 500000);

      await controller.fetchLoanSumByMonth();

      expect(controller.isFetchingLoan, false);
      expect(controller.countLoan, 500000);
      verify(() => mockApi.fetch<int>(request: any(named: 'request'))).called(1);
    });

    test('fetchSavingsSumByMonth updates countSavings', () async {
      when(() => mockApi.fetch<int>(request: any(named: 'request')))
          .thenAnswer((_) async => 250000);

      await controller.fetchSavingsSumByMonth();

      expect(controller.isFetchingSavings, false);
      expect(controller.countSavings, 250000);
      verify(() => mockApi.fetch<int>(request: any(named: 'request'))).called(1);
    });

    test('fetchListEvent handles DioException 404 gracefully', () async {
      when(() => mockApi.fetchList<EventModel>(request: any(named: 'request')))
          .thenThrow(dio.DioException(
        requestOptions: dio.RequestOptions(path: ''),
        response: dio.Response(
          requestOptions: dio.RequestOptions(path: ''),
          statusCode: 404,
        ),
      ));

      await controller.fetchListEvent();

      expect(controller.isFetchingEvents, false);
      expect(controller.events.isEmpty, true);
    });

    test('fetchLoanSumByMonth handles DioException 404 gracefully', () async {
      when(() => mockApi.fetch<int>(request: any(named: 'request')))
          .thenThrow(dio.DioException(
        requestOptions: dio.RequestOptions(path: ''),
        response: dio.Response(
          requestOptions: dio.RequestOptions(path: ''),
          statusCode: 404,
        ),
      ));

      await controller.fetchLoanSumByMonth();

      expect(controller.isFetchingLoan, false);
      expect(controller.countLoan, 0);
    });

    test('fetchSavingsSumByMonth handles DioException 404 gracefully', () async {
      when(() => mockApi.fetch<int>(request: any(named: 'request')))
          .thenThrow(dio.DioException(
        requestOptions: dio.RequestOptions(path: ''),
        response: dio.Response(
          requestOptions: dio.RequestOptions(path: ''),
          statusCode: 404,
        ),
      ));

      await controller.fetchSavingsSumByMonth();

      expect(controller.isFetchingSavings, false);
      expect(controller.countSavings, 0);
    });

    test('fetchUpcomingEvents handles DioException 404 gracefully', () async {
      when(() => mockApi.fetchList<EventModel>(request: any(named: 'request')))
          .thenThrow(dio.DioException(
        requestOptions: dio.RequestOptions(path: ''),
        response: dio.Response(
          requestOptions: dio.RequestOptions(path: ''),
          statusCode: 404,
        ),
      ));

      await controller.fetchUpcomingEvents();

      expect(controller.isFetchingUpcomingEvents, false);
      expect(controller.upcomingEvents.isEmpty, true);
    });
  });
}
