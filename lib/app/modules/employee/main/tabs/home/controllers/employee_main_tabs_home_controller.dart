import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/dashboard_stats/dashboard_stats_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/event/event_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/loan_distribution/loan_distribution_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/member_growth/member_growth_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/savings_distribution/savings_distribution_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';

class EmployeeMainTabsHomeController extends GetxController {
  final ApiHelper apiHelper;
  EmployeeMainTabsHomeController({required this.apiHelper});

  final RxBool _isFetchingEvents = false.obs;
  bool get isFetchingEvents => _isFetchingEvents.value;

  final RxBool _isFetchingMemberGrowth = false.obs;
  bool get isFetchingMemberGrowth => _isFetchingMemberGrowth.value;

  final RxBool _isFetchingSavingsDistribution = false.obs;
  bool get isFetchingSavingsDistribution =>
      _isFetchingSavingsDistribution.value;

  final RxBool _isFetchingLoanDistribution = false.obs;
  bool get isFetchingLoanDistribution => _isFetchingLoanDistribution.value;

  final RxBool _isFetchingDashboardStats = false.obs;
  bool get isFetchingDashboardStats => _isFetchingDashboardStats.value;

  bool get isLoading =>
      isFetchingEvents ||
      isFetchingMemberGrowth ||
      isFetchingSavingsDistribution ||
      isFetchingLoanDistribution ||
      isFetchingDashboardStats;

  final RxList<EventModel> _events = RxList();
  List<EventModel> get events => _events;

  final RxList<MemberGrowthModel> _memberGrowths = RxList();
  List<MemberGrowthModel> get memberGrowths => _memberGrowths;

  final RxList<SavingsDistributionModel> _savingsDistribution = RxList();
  List<SavingsDistributionModel> get savingsDistribution =>
      _savingsDistribution;

  final RxList<LoanDistributionModel> _loanDistribution = RxList();
  List<LoanDistributionModel> get loanDistribution => _loanDistribution;

  final Rx<DashboardStatsModel?> _dashboardStats = Rxn();
  DashboardStatsModel? get dashboardStats => _dashboardStats.value;

  @override
  void onInit() {
    fetchListEvent();
    fetchMemberGrowth();
    fetchSavingsDistribution();
    fetchLoanDistribution();
    fetchDashboardStats();
    super.onInit();
  }

  Future<void> fetchListEvent({String? search}) async {
    _isFetchingEvents.value = true;

    try {
      final List<EventModel> data = await apiHelper.fetchList<EventModel>(
        request: (api) => api.getMeetings(search: search, limit: 5),
      );

      _events.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingEvents.value = false;
    }
  }

  Future<void> fetchMemberGrowth({String? search}) async {
    _isFetchingMemberGrowth.value = true;

    try {
      final List<MemberGrowthModel> data = await apiHelper
          .fetchList<MemberGrowthModel>(
            request: (api) => api.getMemberGrowth(),
          );

      _memberGrowths.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingMemberGrowth.value = false;
    }
  }

  Future<void> fetchSavingsDistribution({String? search}) async {
    _isFetchingSavingsDistribution.value = true;

    try {
      final List<SavingsDistributionModel> data = await apiHelper
          .fetchList<SavingsDistributionModel>(
            request: (api) => api.getSavingsDistribution(),
          );

      _savingsDistribution.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingSavingsDistribution.value = false;
    }
  }

  Future<void> fetchLoanDistribution({String? search}) async {
    _isFetchingLoanDistribution.value = true;

    try {
      final DashboardStatsModel data = await apiHelper
          .fetch<DashboardStatsModel>(
            request: (api) => api.getDashboardStats(),
          );

      _dashboardStats.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingLoanDistribution.value = false;
    }
  }

  Future<void> fetchDashboardStats({String? search}) async {
    _isFetchingDashboardStats.value = true;

    try {
      final List<LoanDistributionModel> data = await apiHelper
          .fetchList<LoanDistributionModel>(
            request: (api) => api.getLoanDistribution(),
          );

      _loanDistribution.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingDashboardStats.value = false;
    }
  }
}
