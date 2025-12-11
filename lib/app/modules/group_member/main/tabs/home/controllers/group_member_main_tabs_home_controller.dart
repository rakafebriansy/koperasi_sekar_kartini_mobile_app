import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/event/event_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';

class GroupMemberMainTabsHomeController extends GetxController {
  final RxBool _isFetchingEvents = false.obs;
  bool get isFetchingEvents => _isFetchingEvents.value;

  bool get isLoading => isFetchingEvents;

  final RxBool _isFetchingLoan = false.obs;
  bool get isFetchingLoan => _isFetchingLoan.value;

  final RxBool _isFetchingSavings = false.obs;
  bool get isFetchingSavings => _isFetchingSavings.value;

  final RxList<EventModel> _events = RxList();
  List<EventModel> get events => _events;

  final RxInt _countLoan = RxInt(0);
  int get countLoan => _countLoan.value;

  final RxInt _countSavings = RxInt(0);
  int get countSavings => _countSavings.value;

  @override
  void onInit() {
    fetchListEvent();
    fetchLoanSumByMonth();
    fetchSavingsSumByMonth();
    super.onInit();
  }

  Future<void> fetchListEvent({String? search}) async {
    _isFetchingEvents.value = true;

    try {
      final List<EventModel> data = await ApiHelper.fetchList<EventModel>(
        request: (api) => api.getMeetings(search: search),
      );

      _events.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingEvents.value = false;
    }
  }

  Future<void> fetchLoanSumByMonth() async {
    _isFetchingLoan.value = true;

    final dt = DateTime.now();

    try {
      final int data = await ApiHelper.fetch<int>(
        request: (api) => api.getLoanSumByMonth(month: dt.month, year: dt.year),
      );

      _countLoan.value = data;
    } catch (e) {
      rethrow;
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingLoan.value = false;
    }
  }

  Future<void> fetchSavingsSumByMonth() async {
    _isFetchingSavings.value = true;

    final dt = DateTime.now();

    try {
      final int data = await ApiHelper.fetch<int>(
        request: (api) =>
            api.getSavingsSumByMonth(month: dt.month, year: dt.year),
      );

      _countSavings.value = data;
    } catch (e) {
      rethrow;

      ErrorHelper.handleError(e);
    } finally {
      _isFetchingSavings.value = false;
    }
  }
}
