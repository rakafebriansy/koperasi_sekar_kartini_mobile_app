import 'dart:async';

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

  Timer? _debounce;

  @override
  void onInit() {
    fetchListData();
    super.onInit();
  }

  Future<void> fetchListData({String? search}) async {
    _isFetching.value = true;

    try {
      final List<UserModel> data = await ApiHelper.fetchList<UserModel>(
        request: (api) => api.getUsers(search: search, role: 'employee'),
      );

      _users.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetching.value = false;
    }
  }

  void onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(seconds: 1), () {
      fetchListData(search: value);
    });
  }
}
