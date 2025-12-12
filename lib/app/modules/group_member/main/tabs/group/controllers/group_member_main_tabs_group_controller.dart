import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';

class GroupMemberMainTabsGroupController extends GetxController {
  TextEditingController searchCtrl = TextEditingController();

  final Rx<GroupModel?> _group = Rxn();
  GroupModel? get group => _group.value;

  final RxList<UserModel> _groupMembers = RxList();
  List<UserModel> get groupMembers => _groupMembers;

  final RxBool _isFetchingGroup = false.obs;
  bool get isFetchingGroup => _isFetchingGroup.value;

  final RxBool _isFetchingGroupMember = false.obs;
  bool get isFetchingGroupMember => _isFetchingGroupMember.value;

  bool get isLoading => isFetchingGroup || isFetchingGroupMember;

  @override
  void onInit() {
    final user = AuthController.find.currentUser!;
    if (user.groupId != null) {
      fetchGroupById(user.groupId!);
      fetchListGroupMember(user.groupId!);
    }
    super.onInit();
  }

  Future<void> fetchGroupById(int id, {String? search}) async {
    _isFetchingGroup.value = true;
    try {
      final GroupModel data = await ApiHelper.instance.fetch<GroupModel>(
        request: (api) => api.getGroup(id: id),
      );

      _group.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingGroup.value = false;
    }
  }

  Future<void> fetchListGroupMember(int groupId, {String? search}) async {
    _isFetchingGroupMember.value = true;

    try {
      final List<UserModel> data = await ApiHelper.instance
          .fetchList<UserModel>(
            request: (api) => api.getUsers(
              search: search,
              role: 'group_member',
              groupId: groupId,
            ),
          );

      _groupMembers.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingGroupMember.value = false;
    }
  }
}
