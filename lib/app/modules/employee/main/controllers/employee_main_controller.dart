import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';

class EmployeeMainController extends GetxController {
  final RxBool _isFetchingGroup = false.obs;
  bool get isFetchingGroup => _isFetchingGroup.value;

  bool get isLoading => isFetchingGroup;

  final RxList<GroupModel> _groups = RxList();
  List<GroupModel> get groups => _groups;

  @override
  void onInit() {
    fetchListGroup();
    super.onInit();
  }

  Future<void> fetchListGroup({String? search}) async {
    _isFetchingGroup.value = true;

    try {
      final List<GroupModel> data = await ApiHelper.fetchList<GroupModel>(
        request: (api) => api.getGroups(search: search),
      );

      _groups.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingGroup.value = false;
    }
  }
}
