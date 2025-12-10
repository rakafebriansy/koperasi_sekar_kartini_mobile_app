import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/loan/loan_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/action_type/action_type_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/string/string_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

class ManageLoanController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final Rx<ActionType?> _action = Rxn();
  ActionType? get action => _action.value;

  final Rx<int?> _id = Rxn();
  int? get id => _id.value;

  final RxBool _isSubmitted = false.obs;
  bool get isSubmitted => _isSubmitted.value;

  final RxBool _isFetchingMember = false.obs;
  bool get isFetchingMember => _isFetchingMember.value;

  TextEditingController amountCtrl = TextEditingController(
    text: !kReleaseMode ? '40000' : '',
  );

  TextEditingController dateCtrl = TextEditingController(
    text: !kReleaseMode ? '02/2024' : '',
  );

  final Rx<UserModel?> _selectedMember = Rxn();
  UserModel? get selectedMember => _selectedMember.value;

  final Rx<LoanType?> _selectedLoanType = Rxn();
  LoanType? get selectedLoanType => _selectedLoanType.value;

  final RxList<UserModel> _members = RxList();
  List<UserModel> get members => _members;

  final List<LoanType> loanTypes = [
    LoanType.pinjamanBiasa,
    LoanType.pinjamanPengadaanBarang,
    LoanType.pinjamanBbm,
    LoanType.pinjamanBahanPokok,
    LoanType.pinjamanBarangDagangan,
    LoanType.pinjamanLebaran,
    LoanType.pinjamanRekreasi,
    LoanType.pinjamanSpesial,
  ];

  @override
  void onInit() {
    final args = (Get.arguments as ArgsWrapper);
    if (args.action == null) throw Exception('action is null');

    _action.value = args.action;

    if (args.action!.isUpdateAction) {
      final group = args.data as LoanModel;
      _id.value = group.id;
    }

    fetchListGroupMember();

    super.onInit();
  }

  void selectLoanType(String? name) {
    if (name == null) return;

    _selectedLoanType.value = loanTypes.firstWhere(
      (item) => item.displayName.toLowerCase() == name.toLowerCase(),
    );
  }

  void selectMember(String? name) {
    if (name == null) return;

    _selectedMember.value = _members.firstWhere(
      (item) => item.name.toLowerCase() == name.toLowerCase(),
    );
  }

  Future<void> fetchListGroupMember({String? search}) async {
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

  Future<void> createLoan() async {
    _isSubmitted.value = true;

    try {
      if (selectedLoanType == null) throw Exception('loan type is null');
      if (selectedMember == null) throw Exception('member is null');

      final dt = dateCtrl.text.toMonthYearDate();

      await ApiHelper.fetchNonReturnable(
        request: (api) => api.createLoan(
          type: selectedLoanType!.snakeCase,
          nominal: int.parse(amountCtrl.text),
          year: dt.year,
          month: dt.month,
          userId: selectedMember!.id
        ),
      );

      Get.back(result: true);
      Get.snackbar('INFO', 'Berhasil membuat pinjaman!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e, canUseNavigator: false);
    } finally {
      _isSubmitted.value = false;
    }
  }

  Future<void> updateLoan() async {
    _isSubmitted.value = true;

    try {
      if (id == null) throw Exception('id is null');
      if (selectedLoanType == null) throw Exception('loan type is null');
      if (selectedMember == null) throw Exception('member is null');

      final dt = dateCtrl.text.toMonthYearDate();

      await ApiHelper.fetchNonReturnable(
        request: (api) => api.updateLoan(
          id: id!,
          type: selectedLoanType!.snakeCase,
          nominal: int.parse(amountCtrl.text),
          year: dt.year,
          month: dt.month,
          userId: selectedMember!.id
        ),
      );

      Get.back(result: true);
      Get.snackbar('INFO', 'Berhasil memperbarui pinjaman!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e, canUseNavigator: false);
    } finally {
      _isSubmitted.value = false;
    }
  }

  Future<void> deleteLoan() async {
    _isSubmitted.value = true;

    if (id == null) {
      throw Exception('id is null');
    }

    try {
      await ApiHelper.fetchNonReturnable(
        request: (api) => api.deleteLoan(id: id!),
      );

      Get.back(result: true);
      Get.snackbar('INFO', 'Berhasil menghapus pinjaman!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e, canUseNavigator: false);
    } finally {
      _isSubmitted.value = false;
    }
  }

  Future<void> submitButton() async {
    if (formKey.currentState!.validate()) {
      try {
        if (action != null) {
          if (action!.isCreateAction) {
            createLoan();
          }
          if (action!.isUpdateAction) updateLoan();
        }
      } catch (e) {
        ErrorHelper.handleError(e);
      }
    }
  }
}
