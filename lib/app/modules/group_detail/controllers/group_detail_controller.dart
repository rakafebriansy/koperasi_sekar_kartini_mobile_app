import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

class GroupDetailController extends GetxController {
  TextEditingController searchCtrl = TextEditingController();

  final chairmanFormKey = GlobalKey<FormState>();
  final facilitatorFormKey = GlobalKey<FormState>();

  final Rx<UserModel?> _selectedChairman = Rxn();
  UserModel? get selectedChairman => _selectedChairman.value;

  final Rx<UserModel?> _selectedFacilitator = Rxn();
  UserModel? get selectedFacilitator => _selectedFacilitator.value;

  final Rx<ActionType?> _action = Rxn();
  ActionType? get action => _action.value;

  final Rx<GroupModel?> _group = Rxn();
  GroupModel? get group => _group.value;

  final RxBool _isSubmitted = false.obs;
  bool get isSubmitted => _isSubmitted.value;

  final RxBool _isFetchingEmployee = false.obs;
  bool get isFetchingEmployee => _isFetchingEmployee.value;

  final RxBool _isFetchingMember = false.obs;
  bool get isFetchingMember => _isFetchingMember.value;

  final RxBool _isFetchingGroup = false.obs;
  bool get isFetchingGroup => _isFetchingGroup.value;

  bool get isLoading =>
      isFetchingEmployee || isFetchingMember || isFetchingGroup;

  final RxList<UserModel> _employees = RxList();
  List<UserModel> get employees => _employees;

  final RxList<UserModel> _members = RxList();
  List<UserModel> get members => _members;

  @override
  void onInit() {
    final args = (Get.arguments as ArgsWrapper);
    _action.value = args.action;
    var group = args.data as GroupModel;
    fetchListEmployee();
    fetchListMember();
    fetchGroupById(group.id);
    super.onInit();
  }

  void selectFacilitator(String? name) {
    if (name == null) return;

    _selectedFacilitator.value = _employees.firstWhere(
      (item) => item.name.toLowerCase() == name.toLowerCase(),
    );
  }

  void selectChairman(String? name) {
    if (name == null) return;

    _selectedChairman.value = _members.firstWhere(
      (item) => item.name.toLowerCase() == name.toLowerCase(),
    );
  }

  Future<void> fetchListEmployee({String? search}) async {
    _isFetchingEmployee.value = true;

    try {
      final List<UserModel> data = await ApiHelper.fetchList<UserModel>(
        request: (api) => api.getUsers(search: search, role: 'employee'),
      );

      _employees.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingEmployee.value = false;
    }
  }

  Future<void> fetchListMember({String? search}) async {
    _isFetchingMember.value = true;

    try {
      final List<UserModel> data = await ApiHelper.fetchList<UserModel>(
        request: (api) => api.getUsers(search: search, role: 'group_member'),
      );

      _members.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingMember.value = false;
    }
  }

  Future<void> fetchGroupById(int id, {String? search}) async {
    _isFetchingGroup.value = true;
    try {
      final GroupModel data = await ApiHelper.fetch<GroupModel>(
        request: (api) => api.getGroup(id: id),
      );

      _group.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingGroup.value = false;
    }
  }

  Future<void> updateFacilitator() async {
    if (facilitatorFormKey.currentState!.validate()) {
      _isSubmitted.value = true;

      if (group == null) throw Exception('group is null');
      if (selectedFacilitator == null) throw Exception('facilitator is null');

      try {
        await ApiHelper.fetch<GroupModel>(
          request: (api) => api.updateGroupFacilitator(
            id: group!.id,
            userId: selectedFacilitator!.id,
          ),
        );

        Get.back();
        Get.snackbar('INFO', 'Berhasil memperbarui informasi PPK!');
      } catch (e) {
        debugPrint(e.toString());
        ErrorHelper.handleError(e, canUseNavigator: false);
      } finally {
        fetchGroupById(group!.id);
        _isSubmitted.value = false;
      }
    }
  }

  Future<void> updateChairman() async {
    if (chairmanFormKey.currentState!.validate()) {
      _isSubmitted.value = true;

      if (group == null) throw Exception('group is null');
      if (selectedChairman == null) throw Exception('chairman is null');

      try {
        await ApiHelper.fetch<GroupModel>(
          request: (api) =>
              api.updateGroupChairman(id: group!.id, userId: selectedChairman!.id),
        );

        Get.back();
        Get.snackbar('INFO', 'Berhasil memperbarui informasi PJK!');
      } catch (e) {
        debugPrint(e.toString());
        ErrorHelper.handleError(e, canUseNavigator: false);
      } finally {
        fetchGroupById(group!.id);
        _isSubmitted.value = false;
      }
    }
  }
}
