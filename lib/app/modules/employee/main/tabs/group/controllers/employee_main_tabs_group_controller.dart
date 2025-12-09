import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';

class EmployeeMainTabsGroupController extends GetxController {
  TextEditingController searchCtrl = TextEditingController();

  final Rx<String> _searchText = ''.obs;
  String get searchText => _searchText.value;

  final RxInt _tabIndex = 0.obs;
  int get tabIndex => _tabIndex.value;

  String get searchPlaceholder {
    switch (tabIndex) {
      case 0:
        return 'Cari kelompok...';
      case 1:
        return 'Cari anggota...';
      case 2:
        return 'Cari anggota...';
      default:
        return '';
    }
  }

  final RxBool _isFetchingGroup = false.obs;
  bool get isFetchingGroup => _isFetchingGroup.value;

  final RxBool _isFetchingVerifiedMember = false.obs;
  bool get isFetchingVerifiedMember => _isFetchingVerifiedMember.value;

  final RxBool _isFetchingInactiveMember = false.obs;
  bool get isFetchingInactiveMember => _isFetchingInactiveMember.value;

  bool get isLoading =>
      isFetchingGroup || isFetchingVerifiedMember || isFetchingInactiveMember;

  final RxList<GroupModel> _groups = RxList();
  List<GroupModel> get groups => _groups;

  final RxList<UserModel> _verifiedMembers = RxList();
  List<UserModel> get verifiedMembers => _verifiedMembers;

  final RxList<UserModel> _inactiveMembers = RxList();
  List<UserModel> get inactiveMembers => _inactiveMembers;

  @override
  void onInit() {
    fetchListGroup();
    fetchListVerifiedMember();
    fetchListInactiveMember();
    debounce<String>(_searchText, (val) {
      if (tabIndex == 0) fetchListGroup(search: val);
      if (tabIndex == 1) fetchListVerifiedMember(search: val);
      if (tabIndex == 2) fetchListInactiveMember(search: val);
    }, time: const Duration(milliseconds: 500));
    super.onInit();
    super.onInit();
  }

  void changeSearchText(String text) {
    _searchText.value = text;
  }

  void changeTabIndex(int tabIndex) {
    _tabIndex.value = tabIndex;
  }

  Future<void> fetchListGroup({String? search}) async {
    _isFetchingGroup.value = true;

    try {
      final List<GroupModel> data = await ApiHelper.fetchList<GroupModel>(
        request: (api) => api.getGroups(search: search),
      );

      _groups.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingGroup.value = false;
    }
  }

  Future<void> fetchListVerifiedMember({String? search}) async {
    _isFetchingVerifiedMember.value = true;

    try {
      final List<UserModel> data = await ApiHelper.fetchList<UserModel>(
        request: (api) => api.getUsers(search: search, role: 'group_member'),
      );

      _verifiedMembers.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingVerifiedMember.value = false;
    }
  }

  Future<void> fetchListInactiveMember({String? search}) async {
    _isFetchingInactiveMember.value = true;

    try {
      final List<UserModel> data = await ApiHelper.fetchList<UserModel>(
        request: (api) => api.getInactiveMembers(search: search),
      );

      _inactiveMembers.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingInactiveMember.value = false;
    }
  }
}
