import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/loan/loan_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/savings/savings_model.dart';
import 'package:mocktail/mocktail.dart';

import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/main/tabs/home/controllers/employee_main_tabs_home_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/event/event_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/member_growth/member_growth_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/savings_distribution/savings_distribution_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/loan_distribution/loan_distribution_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/dashboard_stats/dashboard_stats_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';

import '../mocks/mock_api_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockApiHelper mockApi;

  setUp(() {
    Get.reset();
    Get.testMode = true;
    mockApi = MockApiHelper();
  });

  test("fetchListEvent mengambil event dan mengisi state", () async {
    when(
      () => mockApi.fetchList<EventModel>(request: any(named: 'request')),
    ).thenAnswer((_) async => [DummyHelper.ev(1)]);

    final controller = EmployeeMainTabsHomeController(apiHelper: mockApi);

    await controller.fetchListEvent();

    expect(controller.isFetchingEvents, false);
    expect(controller.events.length, 1);
    expect(controller.events.first.id, DummyHelper.ev(1).id);
  });

  test("fetchMemberGrowth mengambil data pertumbuhan anggota", () async {
    when(
      () =>
          mockApi.fetchList<MemberGrowthModel>(request: any(named: 'request')),
    ).thenAnswer((_) async => [DummyHelper.memberGrowth(1)]);

    final controller = EmployeeMainTabsHomeController(apiHelper: mockApi);

    await controller.fetchMemberGrowth();

    expect(controller.isFetchingMemberGrowth, false);
    expect(controller.memberGrowths.length, 1);
    expect(
      controller.memberGrowths.first.year,
      DummyHelper.memberGrowth(1).year,
    );
  });

  test("fetchSavingsDistribution mengambil distribusi simpanan", () async {
    when(
      () => mockApi.fetchList<SavingsDistributionModel>(
        request: any(named: 'request'),
      ),
    ).thenAnswer(
      (_) async => [
        DummyHelper.savingsDistribution(SavingsType.simpananPokok.name),
      ],
    );

    final controller = EmployeeMainTabsHomeController(apiHelper: mockApi);

    await controller.fetchSavingsDistribution();

    expect(controller.isFetchingSavingsDistribution, false);
    expect(controller.savingsDistribution.length, 1);
  });

  test("fetchLoanDistribution mengambil dashboard stats", () async {
    when(
      () => mockApi.fetch<DashboardStatsModel>(request: any(named: 'request')),
    ).thenAnswer((_) async => DummyHelper.dashboardStats());

    final controller = EmployeeMainTabsHomeController(apiHelper: mockApi);

    await controller.fetchLoanDistribution();

    expect(controller.isFetchingLoanDistribution, false);
    expect(controller.dashboardStats, isNotNull);
  });

  test("fetchDashboardStats mengambil distribusi pinjaman", () async {
    when(
      () => mockApi.fetchList<LoanDistributionModel>(
        request: any(named: 'request'),
      ),
    ).thenAnswer(
      (_) async => [
        DummyHelper.loanDistribution(LoanType.pinjamanBahanPokok.name),
      ],
    );

    final controller = EmployeeMainTabsHomeController(apiHelper: mockApi);

    await controller.fetchDashboardStats();

    expect(controller.isFetchingDashboardStats, false);
    expect(controller.loanDistribution.length, 1);
  });

  test("isLoading true saat salah satu fetch aktif", () async {
    when(
      () => mockApi.fetchList<EventModel>(request: any(named: 'request')),
    ).thenAnswer((_) async {
      await Future.delayed(const Duration(milliseconds: 50));
      return [DummyHelper.ev(1)];
    });

    final controller = EmployeeMainTabsHomeController(apiHelper: mockApi);

    final future = controller.fetchListEvent();

    expect(controller.isLoading, true);

    await future;

    expect(controller.isLoading, false);
  });
}
