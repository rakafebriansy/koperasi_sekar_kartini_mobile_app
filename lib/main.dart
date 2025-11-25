import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:get/get.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/controllers/auth_controller.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);

  //   final api = ApiService();
  // api.setBaseUrl('http://10.0.2.2:8000/api');
  // Get.put(api, permanent: true);
  Get.put(AuthController(), permanent: true);

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812), 
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      },
    ),
  );
}
