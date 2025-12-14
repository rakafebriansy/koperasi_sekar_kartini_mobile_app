import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/report/report_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

class ReportListController extends GetxController {
  ApiHelper apiHelper;

  ReportListController({required this.apiHelper});

  TextEditingController searchCtrl = TextEditingController();

  final RxBool _isFetching = false.obs;
  bool get isFetching => _isFetching.value;

  final Rx<GroupModel?> _group = Rxn();
  GroupModel? get group => _group.value;

  final RxList<ReportModel> _reports = RxList();
  List<ReportModel> get reports => _reports;

  Timer? _debounce;

  @override
  void onInit() {
    final args = (Get.arguments as ArgsWrapper);
    var group = args.data as GroupModel;
    _group.value = group;
    fetchListReport(group.id);
    super.onInit();
  }

  void onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(seconds: 1), () {
      fetchListReport(group!.id, search: value);
    });
  }

  Future<void> fetchListReport(int groupId, {String? search}) async {
    _isFetching.value = true;

    try {
      final List<ReportModel> data = await apiHelper.fetchList<ReportModel>(
        request: (api) => api.getReports(search: search, groupId: groupId),
      );

      _reports.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetching.value = false;
    }
  }
}
