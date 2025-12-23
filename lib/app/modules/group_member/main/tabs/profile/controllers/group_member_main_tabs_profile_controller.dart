import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';

class GroupMemberMainTabsProfileController extends GetxController {
  ApiHelper apiHelper;
  GroupMemberMainTabsProfileController({required this.apiHelper});

  final formKey = GlobalKey<FormState>();

  final RxList<UserModel> _members = RxList();
  List<UserModel> get members => _members;

  final Rx<UserModel?> _selectedMember = Rxn();
  UserModel? get selectedMember => _selectedMember.value;

  final Rx<File?> _memberCardImage = Rxn();
  File? get memberCardImage => _memberCardImage.value;

  final RxBool _isSubmitted = false.obs;
  bool get isSubmitted => _isSubmitted.value;

  final RxBool _isFetchingMembers = false.obs;
  bool get isFetchingMembers => _isFetchingMembers.value;

  @override
  void onInit() {
    fetchListMember();
    super.onInit();
  }

  Future<void> setMemberCardImage(File? file) async {
    try {
      if (file == null) throw Exception('Gambar kosong.');
      _memberCardImage.value = file;
    } catch (e) {
      ErrorHelper.handleError('Gagal unggah gambar: ${e.toString()}');
    }
  }

  void selectMember(String? name) {
    if (name == null) return;

    _selectedMember.value = _members.firstWhere(
      (item) => item.name.toLowerCase() == name.toLowerCase(),
    );
  }

  Future<void> fetchListMember({String? search}) async {
    _isFetchingMembers.value = true;

    try {
      final List<UserModel> data = await apiHelper.fetchList<UserModel>(
        request: (api) => api.getUsers(search: search, role: 'group_member'),
      );

      _members.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingMembers.value = false;
    }
  }

  Future<void> updateMemberCardImage() async {
    if (!(formKey.currentState?.validate() ?? true)) return;
    _isSubmitted.value = true;

    try {
      await apiHelper.fetch<UserModel>(
        request: (api) => api.updateUser(
          id: selectedMember!.id,
          memberCardPhoto: memberCardImage,
        ),
      );

      Get.back(result: true);
      showSnackbar('INFO', 'Berhasil memperbarui KTA!');
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _selectedMember.value = null;
      _memberCardImage.value = null;
      _isSubmitted.value = false;
    }
  }
}
