import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/string/string_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';

class GroupMemberMainTabsGroupController extends GetxController {
  final ApiHelper apiHelper;
  final AuthController authController;

  final formKey = GlobalKey<FormState>();

  GroupMemberMainTabsGroupController({
    required this.apiHelper,
    required this.authController,
  });

  TextEditingController searchCtrl = TextEditingController();

  TextEditingController descCtrl = TextEditingController(
    // text: !kReleaseMode ? 'Lorem ipsum dolor sit amet' : '',
  );

  final Rx<GroupModel?> _group = Rxn();
  GroupModel? get group => _group.value;

  final RxList<UserModel> _groupMembers = RxList();
  List<UserModel> get groupMembers => _groupMembers;

  final RxBool _isFetchingGroup = false.obs;
  bool get isFetchingGroup => _isFetchingGroup.value;

  final RxBool _isFetchingGroupMember = false.obs;
  bool get isFetchingGroupMember => _isFetchingGroupMember.value;

  final RxBool _isSubmitted = false.obs;
  bool get isSubmitted => _isSubmitted.value;

  bool get isLoading => isFetchingGroup || isFetchingGroupMember || isSubmitted;

  @override
  void onInit() {
    final user = authController.currentUser!;
    if (user.groupId != null) {
      fetchGroupById(user.groupId!);
      fetchListGroupMember(user.groupId!);
    }
    super.onInit();
  }

  Future<void> fetchGroupById(int id, {String? search}) async {
    _isFetchingGroup.value = true;
    try {
      final GroupModel data = await apiHelper.fetch<GroupModel>(
        request: (api) => api.getGroup(id: id),
      );

      descCtrl.text = data.description ?? '';

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
      final List<UserModel> data = await apiHelper.fetchList<UserModel>(
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

  Future<void> updateGroup() async {
    if (!(formKey.currentState?.validate() ?? true)) return;

    _isSubmitted.value = true;

    if (group?.id == null) throw Exception('id is null');

    try {
      await apiHelper.fetchNonReturnable(
        request: (api) => api.updateGroup(
          id: group!.id,
          description: descCtrl.text.nullIfEmpty,
        ),
      );

      Get.back();
      await fetchGroupById(group!.id);
      showSnackbar('INFO', 'Berhasil memperbarui grup!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e);
    } finally {
      _isSubmitted.value = false;
    }
  }
}
