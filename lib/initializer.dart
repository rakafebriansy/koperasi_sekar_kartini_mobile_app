import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/remote/serialization/model_registration.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/helpers/api_helper.dart';

abstract class AppInitializer {
  static Future<void> initialize() async {
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
