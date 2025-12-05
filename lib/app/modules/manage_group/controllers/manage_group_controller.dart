import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/work_area/work_area_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/action_type/action_type_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

class ManageGroupController extends GetxController {
  final formKey = GlobalKey<FormState>();

  TextEditingController descCtrl = TextEditingController(
    text: !kReleaseMode ? 'Lorem ipsum dolor sit amet' : '',
  );

  TextEditingController numberCtrl = TextEditingController(
    text: !kReleaseMode ? '1' : '',
  );

  Rx<WorkAreaModel?> selectedWorkArea = Rx<WorkAreaModel?>(
    !kReleaseMode ? DummyHelper.workAreas[0] : null,
  );

  Rx<UserModel?> selectedChairman = Rx<UserModel?>(
    !kReleaseMode ? DummyHelper.users[0] : null,
  );

  Rx<UserModel?> selectedFacilitator = Rx<UserModel?>(
    !kReleaseMode ? DummyHelper.users[1] : null,
  );

  final RxBool _isSubmitted = false.obs;
  bool get isSubmitted => _isSubmitted.value;

  final RxBool _isFetching = false.obs;
  bool get isFetching => _isFetching.value;

  final RxList<WorkAreaModel> _workAreas = RxList();
  List<WorkAreaModel> get workAreas => _workAreas;

  final Rx<ActionType?> _action = Rxn();
  ActionType? get action => _action.value;

  final RxInt _selectedScreen = 0.obs;
  int get selectedScreen => _selectedScreen.value;

  final Rx<int?> _id = Rxn();
  int? get id => _id.value;

  final Rx<bool?> _isActive = Rxn();
  bool? get isActive => _isActive.value;
  String? get isActiveString => isActive == null
      ? 'Belum di-set'
      : isActive!
      ? 'Aktif'
      : 'Tidak Aktif';

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    try {
      final args = (Get.arguments as ArgsWrapper);
      _action.value = args.action;

      if (args.action.isUpdateAction) {
        final group = args.data as GroupModel;
        _id.value = group.id;
        descCtrl.text = group.description ?? '';
        numberCtrl.text = group.number;
      }

      fetchListWorkArea();
    } catch (e) {
      ErrorHelper.handleError(e);
    }
    super.onInit();
  }

  @override
  void dispose() {
    numberCtrl.dispose();
    descCtrl.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void nextScreen() {
    _selectedScreen.value++;
  }

  void prevScreen() {
    _selectedScreen.value--;
  }

  Future<void> fetchListWorkArea({String? search}) async {
    _isFetching.value = true;

    try {
      final List<WorkAreaModel> data = await ApiHelper.fetchList<WorkAreaModel>(
        request: (api) => api.getWorkAreas(search: search),
      );

      _workAreas.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetching.value = false;
    }
  }

  Future<void> fetchListUser({String? search}) async {
    _isFetching.value = true;

    try {
      final List<WorkAreaModel> data = await ApiHelper.fetchList<WorkAreaModel>(
        request: (api) => api.getWorkAreas(search: search),
      );

      _workAreas.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetching.value = false;
    }
  }
}
