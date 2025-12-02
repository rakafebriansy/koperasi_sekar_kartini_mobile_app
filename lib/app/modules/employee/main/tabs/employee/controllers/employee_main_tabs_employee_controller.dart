import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';

class EmployeeMainTabsEmployeeController extends GetxController {
  TextEditingController searchCtrl = TextEditingController();

  final RxBool _isFetching = false.obs;
  bool get isFetching => _isFetching.value;

  final RxList<UserModel> _users = RxList();
  List<UserModel> get users => _users;

  @override
  void onInit() {
    fetchListData();
    super.onInit();
  }

  Future<void> fetchListData() async {
    _isFetching.value = true;

    try {
      final List<UserModel> data = await ApiHelper.fetchList<UserModel>(
        request: (api) => api.getEmployees(),
      );

      _users.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetching.value = false;
    }
  }
}
