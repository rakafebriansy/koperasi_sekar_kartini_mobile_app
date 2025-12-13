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

  final Rx<LoanModel?> _loan = Rxn();
  LoanModel? get loan => _loan.value;

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
    if (args.action != null) _action.value = args.action;

    if (args.data != null) {
      final loan = args.data as LoanModel;
      _loan.value = loan;
      amountCtrl.text = loan.nominal.toString();
      dateCtrl.text = '${loan.month}/${loan.year}';
      _selectedMember.value = loan.user;
      _selectedLoanType.value = loan.type;
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
      final List<UserModel> data = await ApiHelper.instance
          .fetchList<UserModel>(
            request: (api) =>
                api.getUsers(search: search, role: 'group_member'),
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

      await ApiHelper.instance.fetchNonReturnable(
        request: (api) => api.createLoan(
          type: selectedLoanType!.snakeCase,
          nominal: int.parse(amountCtrl.text),
          year: dt.year,
          month: dt.month,
          userId: selectedMember!.id,
        ),
      );

      Get.back(result: true);
      Get.snackbar('INFO', 'Berhasil membuat pinjaman!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e);
    } finally {
      _isSubmitted.value = false;
    }
  }

  Future<void> updateStatus() async {
    _isSubmitted.value = true;

    try {
      if (loan == null) throw Exception('loan is null');
      if (selectedLoanType == null) throw Exception('loan type is null');
      if (selectedMember == null) throw Exception('member is null');

      await ApiHelper.instance.fetchNonReturnable(
        request: (api) =>
            api.updateLoan(id: loan!.id, status: LoanStatus.paid.name),
      );

      Get.back(result: true);
      Get.snackbar('INFO', 'Berhasil memperbarui pinjaman!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e);
    } finally {
      _isSubmitted.value = false;
    }
  }

  Future<void> deleteLoan() async {
    _isSubmitted.value = true;

    if (loan == null) {
      throw Exception('loan is null');
    }

    try {
      await ApiHelper.instance.fetchNonReturnable(
        request: (api) => api.deleteLoan(id: loan!.id),
      );

      Get.back(result: true);
      Get.snackbar('INFO', 'Berhasil menghapus pinjaman!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e);
    } finally {
      _isSubmitted.value = false;
    }
  }

  Future<void> submitButton() async {
    if (formKey.currentState!.validate()) {
      if (action != null) {
        if (action!.isCreateAction) {
          createLoan();
        }
        if (action!.isUpdateAction) updateStatus();
      }
    }
  }
}
