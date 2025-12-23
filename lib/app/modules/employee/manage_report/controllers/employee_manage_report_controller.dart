import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/report/report_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/action_type/action_type_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

class EmployeeManageReportController extends GetxController {
  final ApiHelper apiHelper;

  EmployeeManageReportController({required this.apiHelper});

  final firstFormKey = GlobalKey<FormState>();
  final secondFormKey = GlobalKey<FormState>();
  final thirdFormKey = GlobalKey<FormState>();
  final fourthFormKey = GlobalKey<FormState>();

  final RxInt _selectedScreen = 0.obs;
  int get selectedScreen => _selectedScreen.value;

  final RxBool _isSubmitted = false.obs;
  bool get isSubmitted => _isSubmitted.value;

  final RxBool _isFetchingGroups = false.obs;
  bool get isFetchingGroups => _isFetchingGroups.value;

  TextEditingController yearCtrl = TextEditingController(
    // text: !kReleaseMode ? '2025' : '',
  );

  TextEditingController memberGrowthInCtrl = TextEditingController(
    // text: !kReleaseMode ? '1' : '',
  );

  TextEditingController memberGrowthOutCtrl = TextEditingController(
    // text: !kReleaseMode ? '1' : '',
  );

  TextEditingController administrativeCompliancePercentageCtrl =
      TextEditingController(
        // text: !kReleaseMode ? '100' : ''
      );

  TextEditingController depositCompliancePercentageCtrl = TextEditingController(
    // text: !kReleaseMode ? '80' : '',
  );

  TextEditingController attendancePercentageCtrl = TextEditingController(
    // text: !kReleaseMode ? '70' : '',
  );

  TextEditingController loanParticipationPbCtrl = TextEditingController(
    // text: !kReleaseMode ? '7000000' : '',
  );

  TextEditingController loanParticipationBbmCtrl = TextEditingController(
    // text: !kReleaseMode ? '7000000' : '',
  );

  TextEditingController loanParticipationStoreCtrl = TextEditingController(
    // text: !kReleaseMode ? '8000000' : '',
  );

  TextEditingController loanBalancePbCtrl = TextEditingController(
    // text: !kReleaseMode ? '7000000' : '',
  );

  TextEditingController loanBalanceBbmCtrl = TextEditingController(
    // text: !kReleaseMode ? '7000000' : '',
  );

  TextEditingController loanBalanceStoreCtrl = TextEditingController(
    // text: !kReleaseMode ? '8000000' : '',
  );

  TextEditingController cashParticipationCtrl = TextEditingController(
    // text: !kReleaseMode ? '7000000' : '',
  );

  TextEditingController cashParticipationPercentageCtrl = TextEditingController(
    // text: !kReleaseMode ? '7000000' : '',
  );

  TextEditingController savingsParticipationCtrl = TextEditingController(
    // text: !kReleaseMode ? '8000000' : '',
  );

  TextEditingController savingsParticipationPercentageCtrl =
      TextEditingController(
        // text: !kReleaseMode ? '8000000' : ''
      );

  TextEditingController meetingDepositPercentageCtrl = TextEditingController(
    // text: !kReleaseMode ? '80' : '',
  );

  TextEditingController organizationFinalScorePercentageCtrl =
      TextEditingController(
        // text: !kReleaseMode ? '100' : ''
      );

  TextEditingController receivableScoreCtrl = TextEditingController(
    // text: !kReleaseMode ? '100' : '',
  );

  TextEditingController financialFinalScorePercentageCtrl =
      TextEditingController(
        // text: !kReleaseMode ? '100' : ''
      );

  TextEditingController combinedFinalScorePercentageCtrl =
      TextEditingController(
        // text: !kReleaseMode ? '100' : ''
      );

  final Rx<ActionType?> _action = Rxn();
  ActionType? get action => _action.value;

  final Rx<ReportCriteria?> _selectedCriteria = Rxn();
  ReportCriteria? get selectedCriteria => _selectedCriteria.value;

  final Rx<Quarter?> _selectedQuarter = Rxn();
  Quarter? get selectedQuarter => _selectedQuarter.value;

  final Rx<ReportModel?> _report = Rxn();
  ReportModel? get report => _report.value;

  final Rx<GroupModel?> _group = Rxn();
  GroupModel? get group => _group.value;

  final List<Quarter> quarters = [
    Quarter.triwulan1,
    Quarter.triwulan2,
    Quarter.triwulan3,
    Quarter.triwulan4,
  ];

  final List<ReportCriteria> criterias = [
    ReportCriteria.sangatBaik,
    ReportCriteria.baik,
    ReportCriteria.cukup,
    ReportCriteria.kurang,
    ReportCriteria.sangatKurang,
  ];

  @override
  void onInit() {
    try {
      final args = (Get.arguments as ArgsWrapper);
      if (args.action == null) throw Exception('action is null');

      _action.value = args.action;

      if (args.action!.isCreateAction) {
        _group.value = args.data as GroupModel;
      }

      if (args.action!.isUpdateAction) {
        final report = args.data as ReportModel;
        _report.value = report;
        _selectedQuarter.value = report.quarter;
        _selectedCriteria.value = report.criteria;
        yearCtrl.text = report.year.toString();
        memberGrowthInCtrl.text = report.memberGrowthIn.toString();
        memberGrowthOutCtrl.text = report.memberGrowthOut.toString();
        administrativeCompliancePercentageCtrl.text = report
            .administrativeCompliancePercentage
            .toString();
        depositCompliancePercentageCtrl.text = report
            .depositCompliancePercentage
            .toString();
        attendancePercentageCtrl.text = report.attendancePercentage.toString();
        loanParticipationPbCtrl.text = report.loanParticipationPb.toString();
        loanParticipationBbmCtrl.text = report.loanBalanceBbm.toString();
        loanParticipationStoreCtrl.text = report.loanParticipationStore
            .toString();
        loanBalancePbCtrl.text = report.loanBalancePb.toString();
        loanBalanceBbmCtrl.text = report.loanBalanceBbm.toString();
        loanBalanceStoreCtrl.text = report.loanBalanceStore.toString();
        cashParticipationCtrl.text = report.cashParticipation.toString();
        cashParticipationPercentageCtrl.text = report
            .cashParticipationPercentage
            .toString();
        savingsParticipationCtrl.text = report.savingsParticipation.toString();
        savingsParticipationPercentageCtrl.text = report
            .savingsParticipationPercentage
            .toString();
        meetingDepositPercentageCtrl.text = report.meetingDepositPercentage
            .toString();
        organizationFinalScorePercentageCtrl.text = report
            .organizationFinalScorePercentage
            .toString();
        receivableScoreCtrl.text = report.receivableScorePercentage.toString();
        financialFinalScorePercentageCtrl.text = report
            .financialFinalScorePercentage
            .toString();
        combinedFinalScorePercentageCtrl.text = report
            .combinedFinalScorePercentage
            .toString();
      }
    } catch (e) {
      ErrorHelper.handleError(e);
    }
    super.onInit();
  }

  @override
  void dispose() {
    yearCtrl.dispose();
    memberGrowthInCtrl.dispose();
    memberGrowthOutCtrl.dispose();
    administrativeCompliancePercentageCtrl.dispose();
    depositCompliancePercentageCtrl.dispose();
    attendancePercentageCtrl.dispose();
    loanParticipationPbCtrl.dispose();
    loanParticipationBbmCtrl.dispose();
    loanParticipationStoreCtrl.dispose();
    loanBalancePbCtrl.dispose();
    loanBalanceBbmCtrl.dispose();
    loanBalanceStoreCtrl.dispose();
    cashParticipationCtrl.dispose();
    cashParticipationPercentageCtrl.dispose();
    savingsParticipationCtrl.dispose();
    savingsParticipationPercentageCtrl.dispose();
    meetingDepositPercentageCtrl.dispose();
    organizationFinalScorePercentageCtrl.dispose();
    receivableScoreCtrl.dispose();
    financialFinalScorePercentageCtrl.dispose();
    combinedFinalScorePercentageCtrl.dispose();
    super.dispose();
  }

  void nextScreen() {
    _selectedScreen.value++;
  }

  void prevScreen() {
    _selectedScreen.value--;
  }

  void selectQuarter(String? name) {
    if (name == null) return;

    _selectedQuarter.value = quarters.firstWhere(
      (item) => item.displayName.toLowerCase() == name.toLowerCase(),
    );
  }

  void selectCriteria(String? name) {
    if (name == null) return;

    _selectedCriteria.value = criterias.firstWhere(
      (item) => item.displayName.toLowerCase() == name.toLowerCase(),
    );
  }

  Future<void> createReport() async {
    _isSubmitted.value = true;

    if (group == null) throw Exception('group is null');
    if (selectedCriteria == null) throw Exception('criteria is null');
    if (selectedQuarter == null) throw Exception('quarter is null');

    try {
      await apiHelper.fetch<ReportModel>(
        request: (api) => api.createReport(
          groupId: group!.id,
          quarter: selectedQuarter!.toInt(),
          year: int.parse(yearCtrl.text),
          memberGrowthIn: int.parse(memberGrowthInCtrl.text),
          memberGrowthOut: int.parse(memberGrowthOutCtrl.text),
          administrativeCompliancePercentage: double.parse(
            administrativeCompliancePercentageCtrl.text,
          ),
          depositCompliancePercentage: double.parse(
            depositCompliancePercentageCtrl.text,
          ),
          attendancePercentage: double.parse(attendancePercentageCtrl.text),
          organizationFinalScorePercentage: double.parse(
            organizationFinalScorePercentageCtrl.text,
          ),
          loanParticipationPb: int.parse(loanParticipationPbCtrl.text),
          loanParticipationBbm: int.parse(loanParticipationBbmCtrl.text),
          loanParticipationStore: int.parse(loanParticipationStoreCtrl.text),
          cashParticipation: int.parse(cashParticipationCtrl.text),
          cashParticipationPercentage: double.parse(
            cashParticipationPercentageCtrl.text,
          ),
          savingsParticipation: int.parse(savingsParticipationCtrl.text),
          savingsParticipationPercentage: double.parse(
            savingsParticipationPercentageCtrl.text,
          ),
          meetingDepositPercentage: double.parse(
            meetingDepositPercentageCtrl.text,
          ),
          loanBalancePb: int.parse(loanBalancePbCtrl.text),
          loanBalanceBbm: int.parse(loanBalanceBbmCtrl.text),
          loanBalanceStore: int.parse(loanBalanceStoreCtrl.text),
          receivableScorePercentage: double.parse(receivableScoreCtrl.text),
          financialFinalScorePercentage: double.parse(
            financialFinalScorePercentageCtrl.text,
          ),
          combinedFinalScorePercentage: double.parse(
            combinedFinalScorePercentageCtrl.text,
          ),
          criteria: selectedCriteria!.snakeCase,
        ),
      );

      Get.back(result: true);
      showSnackbar('INFO', 'Berhasil membuat rapot!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e);
    } finally {
      _isSubmitted.value = false;
    }
  }

  Future<void> updateReport() async {
    _isSubmitted.value = true;

    try {
      await apiHelper.fetch<ReportModel>(
        request: (api) => api.updateReport(
          id: report!.id,
          groupId: report!.groupId,
          memberGrowthIn: int.parse(memberGrowthInCtrl.text),
          memberGrowthOut: int.parse(memberGrowthOutCtrl.text),
          administrativeCompliancePercentage: int.parse(
            administrativeCompliancePercentageCtrl.text,
          ),
          depositCompliancePercentage: int.parse(
            depositCompliancePercentageCtrl.text,
          ),
          attendancePercentage: int.parse(attendancePercentageCtrl.text),
          organizationFinalScorePercentage: int.parse(
            organizationFinalScorePercentageCtrl.text,
          ),
          loanParticipationPb: int.parse(loanParticipationPbCtrl.text),
          loanParticipationBbm: int.parse(loanParticipationBbmCtrl.text),
          loanParticipationStore: int.parse(loanParticipationStoreCtrl.text),
          cashParticipation: int.parse(cashParticipationCtrl.text),
          cashParticipationPercentage: int.parse(
            cashParticipationPercentageCtrl.text,
          ),
          savingsParticipation: int.parse(savingsParticipationCtrl.text),
          savingsParticipationPercentage: int.parse(
            savingsParticipationPercentageCtrl.text,
          ),
          meetingDepositPercentage: int.parse(
            meetingDepositPercentageCtrl.text,
          ),
          loanBalancePb: int.parse(loanBalancePbCtrl.text),
          loanBalanceBbm: int.parse(loanBalanceBbmCtrl.text),
          loanBalanceStore: int.parse(loanBalanceStoreCtrl.text),
          receivableScore: int.parse(receivableScoreCtrl.text),
          financialFinalScorePercentage: int.parse(
            financialFinalScorePercentageCtrl.text,
          ),
          combinedFinalScorePercentage: int.parse(
            combinedFinalScorePercentageCtrl.text,
          ),
          criteria: selectedCriteria!.snakeCase,
        ),
      );

      Get.back(result: true);
      showSnackbar('INFO', 'Berhasil membuat rapot!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e);
    } finally {
      _isSubmitted.value = false;
    }
  }

  Future<void> deleteReport() async {
    _isSubmitted.value = true;

    if (report == null) throw Exception('report is null');

    try {
      await apiHelper.fetchNonReturnable(
        request: (api) =>
            api.deleteReport(groupId: report!.groupId, id: report!.id),
      );

      Get.back(result: true);
      showSnackbar('INFO', 'Berhasil menghapus rapot!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e);
    } finally {
      _isSubmitted.value = false;
    }
  }

  Future<void> submitButton() async {
    switch (selectedScreen) {
      case 0:
        if (!(firstFormKey.currentState?.validate() ?? true)) return;
        nextScreen();
        return;
      case 1:
        if (!(secondFormKey.currentState?.validate() ?? true)) return;
        nextScreen();
        return;
      case 2:
        if (!(thirdFormKey.currentState?.validate() ?? true)) return;
        nextScreen();
        return;
      case 3:
        if (!(fourthFormKey.currentState?.validate() ?? true)) return;
        try {
          if (action != null) {
            if (action!.isCreateAction) createReport();
            if (action!.isUpdateAction) updateReport();
          }
        } catch (e) {
          ErrorHelper.handleError(e);
        }
        return;
    }
  }
}
