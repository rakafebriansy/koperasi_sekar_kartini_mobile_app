import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';

class UserLoanListController extends GetxController {
  ApiHelper apiHelper;
  UserLoanListController({required this.apiHelper});

  TextEditingController searchCtrl = TextEditingController();

  Timer? _debounce;

  final RxBool _isFetching = false.obs;
  bool get isFetching => _isFetching.value;

  final RxList<UserModel> _members = RxList();
  List<UserModel> get members => _members;

  @override
  void onInit() {
    fetchListMember();
    super.onInit();
  }

  void onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(seconds: 1), () {
      fetchListMember(search: value);
    });
  }

  Future<void> fetchListMember({String? search}) async {
    _isFetching.value = true;

    try {
      final List<UserModel> data = await apiHelper.fetchList<UserModel>(
        request: (api) => api.getUsers(search: search, role: 'group_member'),
      );

      _members.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetching.value = false;
    }
  }
}
