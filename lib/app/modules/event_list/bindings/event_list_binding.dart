import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

import '../controllers/event_list_controller.dart';

class EventListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventListController>(
      () => EventListController(apiHelper: Get.find<ApiHelper>()),
    );
  }
}
