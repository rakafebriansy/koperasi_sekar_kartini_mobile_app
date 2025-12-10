import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/loan/loan_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';

class LoanListController extends GetxController {
  TextEditingController searchCtrl = TextEditingController();

  final RxBool _isFetching = false.obs;
  bool get isFetching => _isFetching.value;

  final RxBool _isSubmitted = false.obs;
  bool get isSubmitted => _isSubmitted.value;

  final RxList<LoanModel> _loans = RxList();
  List<LoanModel> get loans => _loans;

  Timer? _debounce;

  @override
  void onInit() {
    super.onInit();
    fetchListLoan();
  }

  void onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(seconds: 1), () {
      fetchListLoan(search: value);
    });
  }

  Future<void> fetchListLoan({String? search}) async {
    _isFetching.value = true;

    try {
      final List<LoanModel> data = await ApiHelper.fetchList<LoanModel>(
        request: (api) => api.getLoans(search: search),
      );

      _loans.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetching.value = false;
    }
  }
}
