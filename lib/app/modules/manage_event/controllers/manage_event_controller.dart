import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/event/event_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/date_time/date_time_extension.dart';

class ManageEventController extends GetxController {
  final RxInt _selectedScreen = 0.obs;
  int get selectedScreen => _selectedScreen.value;

  ScrollController scrollController = ScrollController();

  Rx<int?> _id = Rxn();
  int? get id => _id.value;

  Rx<EventType?> selectedEventType = Rx<EventType?>(
    !kReleaseMode ? EventType.groupEvent : null,
  );
  TextEditingController nameCtrl = TextEditingController(
    // text: !kReleaseMode ? 'Pertemuan 1' : '',
  );
  TextEditingController dateTimeCtrl = TextEditingController(
    // text: !kReleaseMode ? '08:00 29/02/2004' : '',
  );
  TextEditingController locationCtrl = TextEditingController(
    // text: !kReleaseMode ? 'Jl. Mawar no.70, Kabupaten Jember' : '',
  );
  TextEditingController descCtrl = TextEditingController(
    // text: !kReleaseMode ? 'Lorem ipsum dolor sit amet' : '',
  );

  final List<EventType> eventTypeData = [
    EventType.groupEvent,
    EventType.coopEvent,
  ];

  @override
  void onInit() {
    try {
      final args = Get.arguments as ArgsWrapper;
      if (args.isUpdateAction) {
        final event = args.data as EventModel;
        print(event);

        _id.value = event.id;
        nameCtrl.text = event.title;
        dateTimeCtrl.text =
            '${event.dateTime.toDotSeparatedHour()} ${event.dateTime.toSlashSeparatedDate()}';
        locationCtrl.text = event.location;
        descCtrl.text = event.description;
      }
    } catch (e) {
      print(e);
    }
    super.onInit();
  }
}
