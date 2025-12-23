import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';

import 'package:koperasi_sekar_kartini_mobile_app/app/modules/report_list/controllers/report_list_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/report/report_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';

import '../mocks/mock_api_helper.dart';
import '../fakes/fake_auth_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ReportListController controller;

  late GroupModel dummyGroup;
  late List<ReportModel> dummyReports;

  setUp(() {
    Get.reset();
    Get.testMode = true;

    dummyGroup = DummyHelper.group(1);
    dummyReports = [DummyHelper.report(1), DummyHelper.report(2)];

    controller = ReportListController(
      apiHelper: mockApi,
      authController: fakeAuth,
    );

    controller.groupRx.value = dummyGroup;
  });

  group('ReportListController', () {
    test('fetchListReport success', () async {
      when(
        () => mockApi.fetchList<ReportModel>(request: any(named: 'request')),
      ).thenAnswer((_) async => dummyReports);

      await controller.fetchListReport(dummyGroup.id);

      expect(controller.isFetching, false);
      expect(controller.reports.length, 2);

      verify(
        () => mockApi.fetchList<ReportModel>(request: any(named: 'request')),
      ).called(1);
    });

    test('fetchListReport handles api error', () async {
      when(
        () => mockApi.fetchList<ReportModel>(request: any(named: 'request')),
      ).thenThrow(Exception('API error'));

      await controller.fetchListReport(dummyGroup.id);

      expect(controller.isFetching, false);
      expect(controller.reports.isEmpty, true);

      verify(
        () => mockApi.fetchList<ReportModel>(request: any(named: 'request')),
      ).called(1);
    });

    test('onSearchChanged triggers fetchListReport after debounce', () {
      fakeAsync((async) {
        when(
          () => mockApi.fetchList<ReportModel>(request: any(named: 'request')),
        ).thenAnswer((_) async => dummyReports);

        controller.onSearchChanged('laporan');

        async.elapse(const Duration(milliseconds: 500));
        verifyNever(
          () => mockApi.fetchList<ReportModel>(request: any(named: 'request')),
        );

        async.elapse(const Duration(seconds: 1));

        verify(
          () => mockApi.fetchList<ReportModel>(request: any(named: 'request')),
        ).called(1);
      });
    });

    test('onSearchChanged cancels previous debounce', () {
      fakeAsync((async) {
        when(
          () => mockApi.fetchList<ReportModel>(request: any(named: 'request')),
        ).thenAnswer((_) async => dummyReports);

        controller.onSearchChanged('lap');
        async.elapse(const Duration(milliseconds: 500));

        controller.onSearchChanged('laporan');

        async.elapse(const Duration(seconds: 1));

        verify(
          () => mockApi.fetchList<ReportModel>(request: any(named: 'request')),
        ).called(1);
      });
    });
  });
}
