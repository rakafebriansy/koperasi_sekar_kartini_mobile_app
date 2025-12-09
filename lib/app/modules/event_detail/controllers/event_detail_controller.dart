import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/event/event_model.dart';

import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

class EventDetailController extends GetxController {
  final Rx<EventModel?> _event = Rxn();
  EventModel? get event => _event.value;

  @override
  void onInit() {
    final args = (Get.arguments as ArgsWrapper);

    _event.value = args.data as EventModel;
    super.onInit();
  }
}
