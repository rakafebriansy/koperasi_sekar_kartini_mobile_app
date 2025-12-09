import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/event/event_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';

import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

class EventDetailController extends GetxController {
  final Rx<EventModel?> _event = Rxn();
  EventModel? get event => _event.value;

  final RxBool _isSubmitted = false.obs;
  bool get isSubmitted => _isSubmitted.value;

  @override
  void onInit() {
    final args = (Get.arguments as ArgsWrapper);

    _event.value = args.data as EventModel;
    super.onInit();
  }

  Future<void> deleteMeeting() async {
    _isSubmitted.value = true;

    try {
      await ApiHelper.fetchNonReturnable(
        request: (api) => api.deleteMeeting(id: event!.id!),
      );

      Get.back(result: true);
      Get.snackbar('INFO', 'Berhasil menghapus kegiatan!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e, canUseNavigator: false);
    } finally {
      _isSubmitted.value = false;
    }
  }
}
