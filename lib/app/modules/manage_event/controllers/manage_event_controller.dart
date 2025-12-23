import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/event/event_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/group/group_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_types.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/action_type/action_type_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/date_time/date_time_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/extensions/string/string_extension.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/error_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

class ManageEventController extends GetxController {
  final ApiHelper apiHelper;
  final AuthController authController;

  ManageEventController({required this.apiHelper, required this.authController});

  final formKey = GlobalKey<FormState>();

  final RxInt _selectedScreen = 0.obs;
  int get selectedScreen => _selectedScreen.value;

  ScrollController scrollController = ScrollController();

  final Rx<int?> _id = Rxn();
  int? get id => _id.value;

  final RxList<GroupModel> _groups = RxList();
  List<GroupModel> get groups => _groups;

  final RxBool _isSubmitted = false.obs;
  bool get isSubmitted => _isSubmitted.value;

  final RxBool _isFetching = false.obs;
  bool get isFetching => _isFetching.value;

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

  final List<EventType> eventTypes = [EventType.group, EventType.coop];

  final Rx<EventType?> _selectedEventType = Rxn();
  EventType? get selectedEventType => _selectedEventType.value;

  final Rx<GroupModel?> _selectedGroup = Rxn();
  GroupModel? get selectedGroup => _selectedGroup.value;

  final Rx<File?> _hintPhoto = Rxn();
  File? get hintPhoto => _hintPhoto.value;

  final Rx<ActionType?> _action = Rxn();
  ActionType? get action => _action.value;

  @override
  void onInit() {
    final args = Get.arguments as ArgsWrapper;
    if (args.action == null) throw Exception('action is null');
    _action.value = args.action;

    if (args.action!.isUpdateAction) {
      final event = args.data as EventModel;

      _id.value = event.id;
      nameCtrl.text = event.name;
      dateTimeCtrl.text =
          '${event.datetime.toDotSeparatedHour()} ${event.datetime.toSlashSeparatedDate()}';
      locationCtrl.text = event.location;
      descCtrl.text = event.description ?? '';
    }

    fetchListGroup();
    super.onInit();
  }

  Future<void> selectHintPhoto(File? file) async {
    try {
      if (file == null) throw Exception('Gambar kosong.');
      _hintPhoto.value = file;
    } catch (e) {
      ErrorHelper.handleError('Gagal unggah gambar: ${e.toString()}');
    }
  }

  void selectEventType(String? name) {
    if (name == null) return;

    _selectedEventType.value = eventTypes.firstWhere(
      (item) => item.displayName.toLowerCase() == name.toLowerCase(),
    );
  }

  void selectGroup(String? name) {
    if (name == null) return;

    final match = RegExp(r'\d+').firstMatch(name);
    if (match == null) return;

    final number = int.parse(match.group(0)!);

    _selectedGroup.value = groups.firstWhere((item) => item.number == number);
  }

  Future<void> fetchListGroup({String? search}) async {
    _isFetching.value = true;

    try {
      final List<GroupModel> data = await apiHelper.fetchList<GroupModel>(
        request: (api) => api.getGroups(search: search),
      );

      _groups.value = data;
    } catch (e) {
      ErrorHelper.handleError(e);
    } finally {
      _isFetching.value = false;
    }
  }

  Future<void> createMeeting() async {
    _isSubmitted.value = true;

    if (selectedEventType == null) throw Exception('event type is null');

    try {
      final user = authController.currentUser!;
      final String dt = DateFormat(
        "HH:mm dd/MM/yyyy",
      ).parse(dateTimeCtrl.text).toIso8601String();

      await apiHelper.fetch<EventModel>(
        request: (api) => api.createMeeting(
          name: nameCtrl.text.nullIfEmpty,
          type: selectedEventType!.name,
          datetime: dt,
          location: locationCtrl.text.nullIfEmpty,
          description: descCtrl.text.nullIfEmpty,
          groupId: user.role == 'group_member'
              ? user.groupId
              : selectedGroup?.id,
          photo: hintPhoto,
        ),
      );

      Get.back(result: true);
      showSnackbar('INFO', 'Berhasil menambahkan kegiatan!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e);
    } finally {
      _isSubmitted.value = false;
    }
  }

  Future<void> updateMeeting() async {
    _isSubmitted.value = true;

    if (id == null) throw Exception('id is null');
    if (selectedEventType == null) throw Exception('event type is null');

    final user = authController.currentUser!;
    try {
      await apiHelper.fetch<EventModel>(
        request: (api) => api.updateMeeting(
          id: id!,
          name: nameCtrl.text.nullIfEmpty,
          type: selectedEventType!.name,
          datetime: dateTimeCtrl.text.isEmpty
              ? null
              : dateTimeCtrl.text.toIsoDateString(),
          location: locationCtrl.text.nullIfEmpty,
          description: descCtrl.text.nullIfEmpty,
          groupId: user.role == 'group_member'
              ? user.groupId
              : selectedGroup?.id,
          userId: user.id,
        ),
      );

      Get.back(result: true);
      showSnackbar('INFO', 'Berhasil memperbarui kegiatan!');
    } catch (e) {
      debugPrint(e.toString());
      ErrorHelper.handleError(e);
    } finally {
      _isSubmitted.value = false;
    }
  }

  Future<void> submitButton() async {
    if (!(formKey.currentState?.validate() ?? true)) return;
    if (action != null) {
      if (action!.isCreateAction) createMeeting();
      if (action!.isUpdateAction) updateMeeting();
    }
  }
}
