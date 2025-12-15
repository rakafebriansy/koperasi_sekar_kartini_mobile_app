import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/event/event_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/member_growth/member_growth_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';

class EmployeeMainTabsHomeController extends GetxController {
  final ApiHelper apiHelper;
  EmployeeMainTabsHomeController({required this.apiHelper});

  final RxBool _isFetchingEvents = false.obs;
  bool get isFetchingEvents => _isFetchingEvents.value;

  final RxBool _isFetchingMemberGrowth = false.obs;
  bool get isFetchingMemberGrowth => _isFetchingEvents.value;

  bool get isLoading => isFetchingEvents || isFetchingMemberGrowth;

  final RxList<EventModel> _events = RxList();
  List<EventModel> get events => _events;

  final RxList<MemberGrowthModel> _memberGrowths = RxList();
  List<MemberGrowthModel> get memberGrowths => _memberGrowths;

  @override
  void onInit() {
    fetchListEvent();
    fetchMemberGrowth();
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
}
