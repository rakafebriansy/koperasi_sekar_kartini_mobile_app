import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeManageReportController extends GetxController {
  ScrollController scrollController = ScrollController();

  RxInt _selectedScreen = 0.obs;
  int get selectedScreen => _selectedScreen.value;

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void nextScreen() {
    _selectedScreen.value++;
  }

  void prevScreen() {
    _selectedScreen.value--;
  }

  TextEditingController incomingMemberCtrl = TextEditingController(
    text: !kReleaseMode ? '1' : '',
  );

  TextEditingController outgoingMemberCtrl = TextEditingController(
    text: !kReleaseMode ? '1' : '',
  );

  TextEditingController totalMembersCtrl = TextEditingController(
    text: !kReleaseMode ? '1' : '',
  );

  TextEditingController administrationOrderPercentageCtrl =
      TextEditingController(text: !kReleaseMode ? '100%' : '');

  TextEditingController depositOrderPercentageCtrl = TextEditingController(
    text: !kReleaseMode ? '80%' : '',
  );

  TextEditingController attendancePercentageCtrl = TextEditingController(
    text: !kReleaseMode ? '70%' : '',
  );

  TextEditingController loanParticipationPbCtrl = TextEditingController(
    text: !kReleaseMode ? '7000000' : '',
  );

  TextEditingController loanParticipationBbmCtrl = TextEditingController(
    text: !kReleaseMode ? '7000000' : '',
  );

  TextEditingController loanParticipationStoreCtrl = TextEditingController(
    text: !kReleaseMode ? '8000000' : '',
  );

  TextEditingController loanBalancePbCtrl = TextEditingController(
    text: !kReleaseMode ? '7000000' : '',
  );

  TextEditingController loanBalanceBbmCtrl = TextEditingController(
    text: !kReleaseMode ? '7000000' : '',
  );

  TextEditingController loanBalanceStoreCtrl = TextEditingController(
    text: !kReleaseMode ? '8000000' : '',
  );

  TextEditingController cashParticipationCtrl = TextEditingController(
    text: !kReleaseMode ? '7000000' : '',
  );

  TextEditingController savingParticipationCtrl = TextEditingController(
    text: !kReleaseMode ? '8000000' : '',
  );

  TextEditingController meetingDepositPercentageCtrl = TextEditingController(
    text: !kReleaseMode ? '80%' : '',
  );

  TextEditingController finalOrganizationScoreCtrl = TextEditingController(
    text: !kReleaseMode ? '100%' : '',
  );

  TextEditingController receivableScoreCtrl = TextEditingController(
    text: !kReleaseMode ? '100%' : '',
  );

  TextEditingController finalFinanceScoreCtrl = TextEditingController(
    text: !kReleaseMode ? '100%' : '',
  );

  TextEditingController combinedScoreCtrl = TextEditingController(
    text: !kReleaseMode ? '100%' : '',
  );

  Rx<String?> selectedCriteria = Rx<String?>(
    !kReleaseMode ? 'CUKUP' : null,
  );

  Rx<String?> selectedTriwulan = Rx<String?>(
    !kReleaseMode ? 'Triwulan III' : null,
  );

  Rx<String?> selectedMonth = Rx<String?>(!kReleaseMode ? 'Desember' : null);
}
