import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/report/report_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

class ReportDetailController extends GetxController {
  late final ReportModel report;

  void onInit() {
    final args = (Get.arguments as ArgsWrapper);
    report = args.data as ReportModel;
    super.onInit();
  }
}
