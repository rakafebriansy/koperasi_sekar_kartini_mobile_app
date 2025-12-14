import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/report_list_controller.dart';

class ReportListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportListController>(
      () => ReportListController(apiHelper: ApiHelper()),
    );
  }
}
