import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

class GroupDetailController extends GetxController {
  TextEditingController searchCtrl = TextEditingController();

  TextEditingController fundAmountCtrl = TextEditingController(
    // text: !kReleaseMode ? '50000' : '',
  );

  final addMemberFormKey = GlobalKey<FormState>();
  final chairmanFormKey = GlobalKey<FormState>();
  final facilitatorFormKey = GlobalKey<FormState>();
  final changeFundAmountFormKey = GlobalKey<FormState>();

  final Rx<UserModel?> _selectedChairman = Rxn();
  UserModel? get selectedChairman => _selectedChairman.value;

  final Rx<UserModel?> _selectedFacilitator = Rxn();
  UserModel? get selectedFacilitator => _selectedFacilitator.value;

  final Rx<FundType?> _selectedFundType = Rxn();
  FundType? get selectedFundType => _selectedFundType.value;

  final Rx<ActionType?> _action = Rxn();
  ActionType? get action => _action.value;

  final Rx<int?> _id = Rxn();
  int? get id => _id.value;

  final Rx<GroupModel?> _group = Rxn();
  GroupModel? get group => _group.value;

  final RxList<FundType> _fundTypes = RxList([
    FundType.sharedLiabilityFund,
    // FundType.groupFund,
    // FundType.socialFund,
  ]);
  List<FundType> get fundTypes => _fundTypes;

  final RxBool _isSubmitted = false.obs;
  bool get isSubmitted => _isSubmitted.value;

  final RxBool _isFetchingEmployee = false.obs;
  bool get isFetchingEmployee => _isFetchingEmployee.value;

  final RxBool _isFetchingUnlistedMembers = false.obs;
  bool get isFetchingUnlistedMembers => _isFetchingUnlistedMembers.value;

  final RxBool _isFetchingGroup = false.obs;
  bool get isFetchingGroup => _isFetchingGroup.value;

  final RxBool _isFetchingGroupMember = false.obs;
  bool get isFetchingGroupMember => _isFetchingGroupMember.value;

  final Rx<UserModel?> _selectedMember = Rxn();
  UserModel? get selectedMember => _selectedMember.value;

  final RxList<UserModel> _groupMembers = RxList();
  List<UserModel> get groupMembers => _groupMembers;

  final RxList<UserModel> _employees = RxList();
  List<UserModel> get employees => _employees;

  final RxList<UserModel> _unlistedMembers = RxList();
  List<UserModel> get unlistedMembers => _unlistedMembers;

  @override
  void onInit() {
    final args = (Get.arguments as ArgsWrapper);
    _action.value = args.action;
    var group = args.data as GroupModel;
    _id.value = group.id;
    fetchListEmployee();
    fetchGroupById(group.id);
    fetchUnlistedMembers(group.workArea.id);
    fetchListGroupMember(group.id);
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

    _selectedChairman.value = _groupMembers.firstWhere(
      (item) => item.name.toLowerCase() == name.toLowerCase(),
    );
  }

  void selectMember(String? name) {
    if (name == null) return;

    _selectedMember.value = _unlistedMembers.firstWhere(
      (item) => item.name.toLowerCase() == name.toLowerCase(),
    );
  }

  void selectFundType(String? name) {
    if (name == null) return;

    _selectedFundType.value = fundTypes.firstWhere(
      (item) => item.displayName.toLowerCase() == name.toLowerCase(),
    );
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

  Future<void> fetchUnlistedMembers(int workAreaId) async {
    _isFetchingUnlistedMembers.value = true;

    try {
      final List<UserModel> data = await ApiHelper.instance
          .fetchList<UserModel>(
            request: (api) => api.getUnlistedMembers(workAreaId: workAreaId),
          );

      _unlistedMembers.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetchingUnlistedMembers.value = false;
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

  Future<void> updateFacilitator() async {
    if (facilitatorFormKey.currentState!.validate()) {
      _isSubmitted.value = true;

      if (group == null) throw Exception('group is null');
      if (selectedFacilitator == null) throw Exception('facilitator is null');

      try {
        await ApiHelper.instance.fetch<GroupModel>(
          request: (api) => api.updateGroupFacilitator(
            id: group!.id,
            userId: selectedFacilitator!.id,
          ),
        );

        Get.back();
        Get.snackbar('INFO', 'Berhasil memperbarui informasi PPK!');
      } catch (e) {
        debugPrint(e.toString());
        ErrorHelper.handleError(e);
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
        await ApiHelper.instance.fetch<GroupModel>(
          request: (api) => api.updateGroupChairman(
            id: group!.id,
            userId: selectedChairman!.id,
          ),
        );

        Get.back();
        Get.snackbar('INFO', 'Berhasil memperbarui informasi PJK!');
      } catch (e) {
        debugPrint(e.toString());
        ErrorHelper.handleError(e);
      } finally {
        fetchGroupById(group!.id);
        _isSubmitted.value = false;
      }
    }
  }

  Future<void> addMember() async {
    if (addMemberFormKey.currentState!.validate()) {
      _isSubmitted.value = true;

      try {
        if (group == null) throw Exception('group is null');
        if (selectedMember == null) throw Exception('member is null');

        await ApiHelper.instance.fetchNonReturnable(
          request: (api) =>
              api.addGroupMember(id: selectedMember!.id, groupId: group!.id),
        );

        Get.back();
        Get.snackbar('INFO', 'Berhasil mengubah informasi kas!');
      } catch (e) {
        debugPrint(e.toString());
        ErrorHelper.handleError(e);
      } finally {
        fetchListGroupMember(group!.id);
        _isSubmitted.value = false;
      }
    }
  }

  Future<void> changeFundAmount() async {
    if (changeFundAmountFormKey.currentState!.validate()) {
      _isSubmitted.value = true;

      try {
        if (group == null) throw Exception('group is null');
        if (selectedFundType == null) throw Exception('fund type is null');

        await ApiHelper.instance.fetchNonReturnable(
          request: (api) => api.updateFundAmount(
            id: group!.id,

            fundAmount: int.parse(fundAmountCtrl.text),
            fundType: selectedFundType?.name,
          ),
        );

        Get.back();
        Get.snackbar('INFO', 'Berhasil menambah anggota!');
      } catch (e) {
        debugPrint(e.toString());
        ErrorHelper.handleError(e);
      } finally {
        fetchGroupById(group!.id);
        _isSubmitted.value = false;
      }
    }
  }
}
