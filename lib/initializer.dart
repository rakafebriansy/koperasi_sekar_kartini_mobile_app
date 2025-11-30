import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/data/serialization/model_registry.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/api/user/user_model.dart';

abstract class AppInitializer {
  static Future<void> initialize() async {
    //register model
    ModelRegistry.register<UserModel>(
      fromJson: (json) => UserModel.fromJson(json),
      toJson: (obj) => obj.toJson(),
    );

    //intl
    await initializeDateFormatting('id_ID', null);

    //global
    Get.put(const FlutterSecureStorage());
    Get.put(AuthController(), permanent: true);
  }
}
