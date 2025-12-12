import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/savings/savings_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';

class SavingsListController extends GetxController {
  TextEditingController searchCtrl = TextEditingController();

  final RxBool _isFetching = false.obs;
  bool get isFetching => _isFetching.value;

  final RxBool _isSubmitted = false.obs;
  bool get isSubmitted => _isSubmitted.value;

  final RxList<SavingsModel> _savingsList = RxList();
  List<SavingsModel> get savingsList => _savingsList;

  Timer? _debounce;

  @override
  void onInit() {
    super.onInit();
    fetchListSavings();
  }

  void onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(seconds: 1), () {
      fetchListSavings(search: value);
    });
  }

  Future<void> fetchListSavings({String? search}) async {
    _isFetching.value = true;

    try {
      final List<SavingsModel> data = await ApiHelper.instance
          .fetchList<SavingsModel>(
            request: (api) => api.getSavings(search: search),
          );

      _savingsList.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetching.value = false;
    }
  }
}
