import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/local/notification/local_notification_service.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/event/event_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/routes/app_pages.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/exceptions/notification_exception.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/wrappers/args_wrapper.dart';

class FcmService {
  static final FcmService _instance = FcmService._internal(
    apiHelper: Get.find<ApiHelper>(),
  );
  factory FcmService() => _instance;

  final ApiHelper apiHelper;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  FcmService._internal({required this.apiHelper});

  bool _isHandlingNotification = false;

  Future<void> init() async {
    await _requestPermission();
    await _setupHandlers();
    _listenLocalNotificationTap();
    await _logToken();
    _listenTokenRefresh();
  }

  Future<void> _requestPermission() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    debugPrint('🔔 Permission: ${settings.authorizationStatus}');
  }

  Future<void> _setupHandlers() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('📱 Got FCM message: ${message.data}');
      LocalNotificationService.show(
        title: message.notification?.title,
        body: message.notification?.body,
        payload: message.data,
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      debugPrint('📲 Opened from notification');
      _handleNotificationNavigation(message);
    });

    RemoteMessage? initialMessage = await FirebaseMessaging.instance
        .getInitialMessage();

    if (initialMessage != null) {
      debugPrint('🚀 Opened from terminated');
      debugPrint('Data: ${initialMessage.data}');
      _handleNotificationNavigation(initialMessage);
    }
  }

  Future<String?> getToken() async {
    return await _messaging.getToken();
  }

  Future<void> sendToken() async {
    final token = await _messaging.getToken();
    debugPrint(
      'auth token: ${await AuthController.find.tokenManager.getToken()}',
    );
    debugPrint('📱 FCM TOKEN: $token');
    debugPrint('sending fcm token...');
    if (token != null) {
      await apiHelper.fetchNonReturnable(
        request: (api) => api.sendFcmTokenToApi(fcmToken: token),
      );
    }
  }

  Future<void> _logToken() async {
    final token = await getToken();
    debugPrint('🔥 FCM TOKEN: $token');
  }

  Future<void> _handleNotificationNavigation(RemoteMessage message) async {
    await _handleNotificationData(message.data);
  }

  Future<void> _handleNotificationData(Map<String, dynamic> data) async {
    if (_isHandlingNotification) return;
    _isHandlingNotification = true;
    try {
      if (!data.containsKey('type')) {
        throw NotificationException('Invalid notification payload');
      }

      switch (data['type']) {
        case 'meeting_reminder':
          await _handleMeetingReminder(data);
          break;

        default:
          throw NotificationException(
            'Unknown notification type: ${data['type']}',
          );
      }
    } catch (e, stack) {
      _handleNotificationError(e, stack);
    } finally {
      _isHandlingNotification = false;
    }
  }

  void _listenTokenRefresh() {
    _messaging.onTokenRefresh.listen((newToken) {
      debugPrint('🔄 Token refreshed: $newToken');
      apiHelper.fetchNonReturnable(
        request: (api) => api.sendFcmTokenToApi(fcmToken: newToken),
      );
    });
  }

  void _listenLocalNotificationTap() {
    LocalNotificationService.notificationTapNotifier.addListener(() {
      final data = LocalNotificationService.notificationTapNotifier.value;
      if (data == null) return;

      _handleNotificationData(data);
    });
  }

  Future<void> _handleMeetingReminder(Map<String, dynamic> data) async {
    final meetingId = data['meeting_id'];

    if (meetingId == null) {
      throw NotificationException('Meeting ID missing');
    }

    final event = await apiHelper.fetch<EventModel>(
      request: (api) => api.getMeeting(id: int.parse(meetingId)),
    );

    if (event == null) {
      debugPrint('Event not found for ID $meetingId');
      return;
    }

    Get.toNamed(Routes.EVENT_DETAIL, arguments: ArgsWrapper(data: event));
  }

  void _handleNotificationError(Object error, StackTrace stack) {
    debugPrint('❌ Notification error: $error');

    if (!Get.isRegistered<AuthController>()) {
      Get.offAllNamed(Routes.LOGIN);
      return;
    }

    final auth = Get.find<AuthController>();

    if (auth.authState.value != AuthState.authenticated) {
      auth.logout();
      return;
    }

    final String route = auth.currentUser == null
        ? Routes.LOGIN
        : auth.currentUser!.role == 'group_member'
        ? Routes.GROUP_MEMBER_MAIN_TABS_HOME
        : Routes.EMPLOYEE_MAIN_TABS_HOME;

    Get.offAllNamed(route);

    Get.snackbar(
      'Notifikasi gagal dibuka',
      _mapErrorToMessage(error),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 4),
    );
  }

  String _mapErrorToMessage(Object error) {
    if (error is NotificationException) {
      return error.message;
    }

    if (error.toString().contains('SocketException')) {
      return 'Koneksi internet bermasalah';
    }

    return 'Terjadi kesalahan saat membuka notifikasi';
  }
}
