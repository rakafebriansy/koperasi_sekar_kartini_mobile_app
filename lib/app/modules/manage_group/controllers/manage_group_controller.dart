import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/work_area/work_area_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/action_type/action_type_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/string/string_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
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

  final Rx<WorkAreaModel?> _selectedWorkArea = Rxn();
  WorkAreaModel? get selectedWorkArea => _selectedWorkArea.value;

  final Rx<UserModel?> _selectedChairman = Rxn();
  UserModel? get selectedChairman => _selectedChairman.value;

  final Rx<UserModel?> _selectedFacilitator = Rxn();
  UserModel? get selectedFacilitator => _selectedFacilitator.value;

  final RxBool _isSubmitted = false.obs;
  bool get isSubmitted => _isSubmitted.value;

  final RxBool _isFetchingWorkArea = false.obs;
  bool get isFetchingWorkArea => _isFetchingWorkArea.value;

  final RxBool _isFetchingEmployee = false.obs;
  bool get isFetchingEmployee => _isFetchingEmployee.value;

  final RxBool _isFetchingMember = false.obs;
  bool get isFetchingMember => _isFetchingMember.value;

  bool get isLoading =>
      isFetchingEmployee || isFetchingWorkArea || isFetchingMember;

  final RxList<WorkAreaModel> _workAreas = RxList();
  List<WorkAreaModel> get workAreas => _workAreas;

  final RxList<UserModel> _employees = RxList();
  List<UserModel> get employees => _employees;

  final RxList<UserModel> _members = RxList();
  List<UserModel> get members => _members;

  final Rx<ActionType?> _action = Rxn();
  ActionType? get action => _action.value;

  final RxInt _selectedScreen = 0.obs;
  int get selectedScreen => _selectedScreen.value;

  final Rx<int?> _id = Rxn();
  int? get id => _id.value;

  @override
  void onInit() {
    final args = (Get.arguments as ArgsWrapper);
    if (args.action == null) throw Exception('action is null');

    _action.value = args.action;

    if (args.action!.isUpdateAction) {
      final group = args.data as GroupModel;
      _id.value = group.id;
      descCtrl.text = group.description ?? '';
      numberCtrl.text = group.number.toString();
      _selectedWorkArea.value = group.workArea;
      _selectedChairman.value = group.chairman;
      _selectedFacilitator.value = group.facilitator;
      fetchListGroupMember();
    }

    fetchListWorkArea();
    fetchListEmployee();
    super.onInit();
  }

  @override
  void dispose() {
    numberCtrl.dispose();
    descCtrl.dispose();
    super.dispose();
  }

  void nextScreen() {
    _selectedScreen.value++;
  }

  void prevScreen() {
    _selectedScreen.value--;
  }

  void selectWorkArea(String? name) {
    if (name == null) return;

    _selectedWorkArea.value = _workAreas.firstWhere(
      (item) => item.name.toLowerCase() == name.toLowerCase(),
    );
  }

  void selectChairman(String? name) {
    if (name == null) return;

    _selectedChairman.value = _members.firstWhere(
      (item) => item.name.toLowerCase() == name.toLowerCase(),
    );
  }

  void selectFacilitator(String? name) {
    if (name == null) return;

    _selectedFacilitator.value = _employees.firstWhere(
      (item) => item.name.toLowerCase() == name.toLowerCase(),
    );
  }

  Future<void> fetchListWorkArea({String? search}) async {
    _isFetchingWorkArea.value = true;

    try {
      final List<WorkAreaModel> data = await ApiHelper.instance
          .fetchList<WorkAreaModel>(
            request: (api) => api.getWorkAreas(search: search),
          );

      _workAreas.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingWorkArea.value = false;
    }
  }

  Future<void> fetchListEmployee({String? search}) async {
    _isFetchingEmployee.value = true;

    try {
      final List<UserModel> data = await ApiHelper.instance
          .fetchList<UserModel>(
            request: (api) => api.getUsers(search: search, role: 'employee'),
          );

      _employees.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingEmployee.value = false;
    }
  }

  Future<void> fetchListGroupMember({String? search}) async {
    _isFetchingMember.value = true;

    try {
      final List<UserModel> data = await ApiHelper.instance
          .fetchList<UserModel>(
            request: (api) =>
                api.getUsers(search: search, role: 'group_member', groupId: id),
          );

      _members.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingMember.value = false;
    }
  }

  Future<void> createGroup() async {
    _isSubmitted.value = true;

    try {
      await ApiHelper.instance.fetchNonReturnable(
        request: (api) => api.createGroup(
          number: numberCtrl.text.isNotEmpty
              ? int.parse(numberCtrl.text)
              : null,
          description: descCtrl.text.nullIfEmpty,
          workAreaId: selectedWorkArea?.id,
          chairmanId: selectedChairman?.id,
          facilitatorId: selectedFacilitator?.id,
        ),
      );

      Get.back(result: true);
      Get.snackbar('INFO', 'Berhasil membuat grup!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e);
    } finally {
      _isSubmitted.value = false;
    }
  }

  Future<void> updateGroup() async {
    _isSubmitted.value = true;

    if (id == null) throw Exception('id is null');

    try {
      await ApiHelper.instance.fetchNonReturnable(
        request: (api) => api.updateGroup(
          id: id!,
          number: numberCtrl.text.isNotEmpty
              ? int.parse(numberCtrl.text)
              : null,
          description: descCtrl.text.nullIfEmpty,
          workAreaId: selectedWorkArea?.id,
          chairmanId: selectedChairman?.id,
          facilitatorId: selectedFacilitator?.id,
        ),
      );

      Get.back(result: true);
      Get.snackbar('INFO', 'Berhasil memperbarui grup!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e);
    } finally {
      _isSubmitted.value = false;
    }
  }

  Future<void> deleteGroup() async {
    _isSubmitted.value = true;

    if (id == null) {
      throw Exception('id is null');
    }

    try {
      await ApiHelper.instance.fetchNonReturnable(
        request: (api) => api.deleteGroup(id: id!),
      );

      Get.back(result: true);
      Get.snackbar('INFO', 'Berhasil menghapus grup!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e);
    } finally {
      _isSubmitted.value = false;
    }
  }

  Future<void> submitButton() async {
    if (formKey.currentState!.validate()) {
      try {
        if (action != null) {
          if (action!.isCreateAction) {
            createGroup();
          }
          if (action!.isUpdateAction) updateGroup();
        }
      } catch (e) {
        ErrorHelper.handleError(e);
      }
    }
  }
}
