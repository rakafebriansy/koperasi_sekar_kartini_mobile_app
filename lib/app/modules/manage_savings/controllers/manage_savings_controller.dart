import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/savings/savings_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/action_type/action_type_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/string/string_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

class ManageSavingsController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final Rx<ActionType?> _action = Rxn();
  ActionType? get action => _action.value;

  final Rx<SavingsModel?> _savings = Rxn();
  SavingsModel? get savings => _savings.value;

  final RxBool _isSubmitted = false.obs;
  bool get isSubmitted => _isSubmitted.value;

  final RxBool _isFetchingMember = false.obs;
  bool get isFetchingMember => _isFetchingMember.value;

  TextEditingController amountCtrl = TextEditingController(
    // text: !kReleaseMode ? '40000' : '',
  );

  TextEditingController dateCtrl = TextEditingController(
    // text: !kReleaseMode ? '02/2024' : '',
  );

  final Rx<SavingsType?> _selectedSavingsType = Rxn();
  SavingsType? get selectedSavingsType => _selectedSavingsType.value;

  final Rx<UserModel?> _user = Rxn();
  UserModel? get user => _user.value;

  final List<SavingsType> savingsTypes = [
    SavingsType.simpananBerjangka,
    SavingsType.simpananBersama,
    SavingsType.simpananHariRaya,
    SavingsType.simpananHariTua,
    SavingsType.simpananPokok,
    SavingsType.simpananRekreasi,
    SavingsType.simpananSukarela,
    SavingsType.simpananWajib,
    SavingsType.simpananWajibKhusus,
  ];

  @override
  void onInit() {
    final args = (Get.arguments as ArgsWrapper);

    if (args.action != null && args.action!.isCreateAction) {
      _action.value = args.action;
      _user.value = args.data as UserModel;
    } else if (args.data != null) {
      final savings = args.data as SavingsModel;
      _savings.value = savings;
      amountCtrl.text = savings.nominal.toString();
      dateCtrl.text = '${savings.month}/${savings.year}';
      _selectedSavingsType.value = savings.type;
    }

    super.onInit();
  }

  void selectSavingsType(String? name) {
    if (name == null) return;

    _selectedSavingsType.value = savingsTypes.firstWhere(
      (item) => item.displayName.toLowerCase() == name.toLowerCase(),
    );
  }

  Future<void> createSavings() async {
    if (!(formKey.currentState?.validate() ?? true)) return;
    _isSubmitted.value = true;

    try {
      if (selectedSavingsType == null) throw Exception('savings type is null');
      if (user == null) throw Exception('user is null');

      final dt = dateCtrl.text.toMonthYearDate();

      await ApiHelper.instance.fetchNonReturnable(
        request: (api) => api.createSavings(
          type: selectedSavingsType!.snakeCase,
          nominal: int.parse(amountCtrl.text),
          year: dt.year,
          month: dt.month,
          userId: user!.id,
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

  Future<void> deleteSavings() async {
    _isSubmitted.value = true;

    if (savings == null) {
      throw Exception('savings is null');
    }

    try {
      await ApiHelper.instance.fetchNonReturnable(
        request: (api) => api.deleteSavings(id: savings!.id),
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
}
