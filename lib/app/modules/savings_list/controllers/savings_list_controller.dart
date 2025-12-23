import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/savings/savings_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

class SavingsListController extends GetxController {
  final ApiHelper apiHelper;
  final AuthController authController;

  SavingsListController({
    required this.apiHelper,
    required this.authController,
  });
  TextEditingController searchCtrl = TextEditingController();

  final RxBool _isFetching = false.obs;
  bool get isFetching => _isFetching.value;

  final RxBool _isSubmitted = false.obs;
  bool get isSubmitted => _isSubmitted.value;

  final RxList<SavingsModel> _savingsList = RxList();
  List<SavingsModel> get savingsList => _savingsList;

  Timer? _debounce;

  final Rx<UserModel?> _member = Rxn();
  UserModel? get member => _member.value;

  @override
  void onInit() {
    final args = (Get.arguments as ArgsWrapper);
    var user = args.data as UserModel;
    _member.value = user;
    fetchListSavings(memberId: user.id);
    super.onInit();
  }

  void onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(seconds: 1), () {
      fetchListSavings(search: value);
    });
  }

  Future<void> fetchListSavings({String? search, int? memberId}) async {
    _isFetching.value = true;

    try {
      final List<SavingsModel> data = await apiHelper.fetchList<SavingsModel>(
        request: (api) => api.getSavings(search: search, memberId: memberId),
      );

      _savingsList.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetching.value = false;
    }
  }
}
