import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

class EmployeeGroupMemberDetailController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final Rx<GroupModel?> _group = Rxn();
  GroupModel? get group => _group.value;

  final RxBool _isSubmitted = false.obs;
  bool get isSubmitted => _isSubmitted.value;

  final RxBool _isFetchingMember = false.obs;
  bool get isFetchingMember => _isFetchingMember.value;

  final RxBool _isFetchingGroupMember = false.obs;
  bool get isFetchingGroupMember => _isFetchingGroupMember.value;

  bool get isLoading => isFetchingMember || isFetchingGroupMember;

  final Rx<UserModel?> _selectedMember = Rxn();
  UserModel? get selectedMember => _selectedMember.value;

  final RxList<UserModel> _groupMembers = RxList();
  List<UserModel> get groupMembers => _groupMembers;

  final RxList<UserModel> _members = RxList();
  List<UserModel> get members => _members;
  @override
  void onInit() {
    final args = (Get.arguments as ArgsWrapper);
    _group.value = args.data as GroupModel;
    fetchUnlistedMembers();
    fetchListGroupMember();
    super.onInit();
  }

  void selectMember(String? name) {
    if (name == null) return;

    _selectedMember.value = _members.firstWhere(
      (item) => item.name.toLowerCase() == name.toLowerCase(),
    );
  }

  Future<void> fetchUnlistedMembers({String? search}) async {
    _isFetchingMember.value = true;

    try {
      final List<UserModel> data = await ApiHelper.fetchList<UserModel>(
        request: (api) => api.getUnlistedUsers(
          search: search,
          workAreaId: group!.workArea!.id,
        ),
      );

      _members.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingMember.value = false;
    }
  }

  Future<void> fetchListGroupMember({String? search}) async {
    _isFetchingGroupMember.value = true;

    if (group == null) throw Exception('group is null');

    try {
      final List<UserModel> data = await ApiHelper.fetchList<UserModel>(
        request: (api) => api.getUsers(
          search: search,
          role: 'group_member',
          groupId: group!.id,
        ),
      );

      _groupMembers.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingGroupMember.value = false;
    }
  }

  Future<void> addMember() async {
    _isSubmitted.value = true;

    try {
      if (formKey.currentState!.validate()) {
        if (group == null) throw Exception('group is null');
        if (selectedMember == null) throw Exception('member is null');

        await ApiHelper.fetchNonReturnable(
          request: (api) =>
              api.addGroupMember(id: selectedMember!.id, groupId: group!.id),
        );

        Get.back();
        Get.snackbar('INFO', 'Berhasil menambah anggota!');
      }
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e, canUseNavigator: false);
    } finally {
      fetchListGroupMember();
      _isSubmitted.value = false;
    }
  }
}
