import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/group_report_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/dummy_helper.dart';

class ReportDetailController extends GetxController {
  final RxList<GroupReportModel> groupReportModels = RxList(
    DummyHelper.dummyGroupReports,
  );

  final Rx<GroupReportModel?> _selectedGroupReport = Rxn();
  GroupReportModel? get selectedGroupReport => _selectedGroupReport.value;
}
