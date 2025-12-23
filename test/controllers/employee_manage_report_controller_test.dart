import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:mocktail/mocktail.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/report/report_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_report/controllers/employee_manage_report_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

class MockApiHelper extends Mock implements ApiHelper {}

void main() {
  late EmployeeManageReportController controller;
  late MockApiHelper mockApi;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() {
    mockApi = MockApiHelper();
    controller = EmployeeManageReportController(apiHelper: mockApi);

    // inject Get.arguments jika perlu
    Get.testMode = true;
  });

  group('EmployeeManageReportController', () {
    final groupModel = DummyHelper.group(1);
    final reportModel = DummyHelper.report(1);

    test('createReport calls apiHelper.fetch and returns ReportModel', () async {
      when(() => mockApi.fetch<ReportModel>(request: any(named: 'request')))
          .thenAnswer((_) async => reportModel);

      controller.onInit();
      controller.selectQuarter(Quarter.triwulan1.displayName);
      controller.selectCriteria(ReportCriteria.sangatBaik.displayName);
      controller.yearCtrl.text = '2025';
      controller.memberGrowthInCtrl.text = '1';
      controller.memberGrowthOutCtrl.text = '1';
      controller.administrativeCompliancePercentageCtrl.text = '100';
      controller.depositCompliancePercentageCtrl.text = '80';
      controller.attendancePercentageCtrl.text = '70';
      controller.organizationFinalScorePercentageCtrl.text = '100';
      controller.loanParticipationPbCtrl.text = '7000000';
      controller.loanParticipationBbmCtrl.text = '7000000';
      controller.loanParticipationStoreCtrl.text = '8000000';
      controller.loanBalancePbCtrl.text = '7000000';
      controller.loanBalanceBbmCtrl.text = '7000000';
      controller.loanBalanceStoreCtrl.text = '8000000';
      controller.cashParticipationCtrl.text = '7000000';
      controller.cashParticipationPercentageCtrl.text = '70';
      controller.savingsParticipationCtrl.text = '8000000';
      controller.savingsParticipationPercentageCtrl.text = '80';
      controller.meetingDepositPercentageCtrl.text = '80';
      controller.receivableScoreCtrl.text = '100';
      controller.financialFinalScorePercentageCtrl.text = '100';
      controller.combinedFinalScorePercentageCtrl.text = '100';

      controller.groupRx.value = groupModel;
      controller.selectedQuarterRx.value = Quarter.triwulan1;
      controller.selectedCriteriaRx.value = ReportCriteria.sangatBaik;

      await controller.createReport();

      expect(controller.isSubmitted, false);
      verify(() => mockApi.fetch<ReportModel>(request: any(named: 'request'))).called(1);
    });

    test('updateReport calls apiHelper.fetch and returns ReportModel', () async {
      when(() => mockApi.fetch<ReportModel>(request: any(named: 'request')))
          .thenAnswer((_) async => reportModel);

      controller.reportRx.value = reportModel;
      controller.selectedCriteriaRx.value = ReportCriteria.sangatBaik;
      controller.yearCtrl.text = '2025';

      await controller.updateReport();

      expect(controller.isSubmitted, false);
      verify(() => mockApi.fetch<ReportModel>(request: any(named: 'request'))).called(1);
    });

    test('deleteReport calls apiHelper.fetchNonReturnable', () async {
      when(() => mockApi.fetchNonReturnable(request: any(named: 'request')))
          .thenAnswer((_) async => Future<void>.value());

      controller.reportRx.value = reportModel;

      await controller.deleteReport();

      expect(controller.isSubmitted, false);
      verify(() => mockApi.fetchNonReturnable(request: any(named: 'request'))).called(1);
    });
  });
}
