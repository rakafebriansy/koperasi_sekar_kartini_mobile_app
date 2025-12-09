import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/event/event_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';

class EmployeeMainTabsHomeController extends GetxController {
  final RxBool _isFetchingEvents = false.obs;
  bool get isFetchingEvents => _isFetchingEvents.value;

  bool get isLoading => isFetchingEvents;

  final RxList<EventModel> _events = RxList();
  List<EventModel> get events => _events;

  @override
  void onInit() {
    fetchListEvent();
    super.onInit();
  }

  Future<void> fetchListEvent({String? search}) async {
    _isFetchingEvents.value = true;

    try {
      final List<EventModel> data = await ApiHelper.fetchList<EventModel>(
        request: (api) => api.getMeetings(search: search,limit: 5),
      );

      _events.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingEvents.value = false;
    }
  }
}
