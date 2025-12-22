import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/local/notification/local_notification_service.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/messaging/fcm_service/fcm_service.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/remote/serialization/model_registration.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

abstract class AppInitializer {
  static Future<void> initialize() async {
    //firebase
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    
    //local notification
    await LocalNotificationService.init();

    //fcm service
    await FcmService().init();

    // register models
    registerModels();

    //intl
    await initializeDateFormatting('id_ID', null);

    //global
    Get.put(const FlutterSecureStorage());
    Get.put(AuthController(), permanent: true);
    Get.put(ApiHelper(), permanent: true);
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint('🌙 Background message: ${message.messageId}');
}
