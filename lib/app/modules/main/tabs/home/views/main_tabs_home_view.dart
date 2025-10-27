import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';

import '../controllers/main_tabs_home_controller.dart';

class MainTabsHomeView extends GetView<MainTabsHomeController> {
  const MainTabsHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.sp),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          child: Image.asset(
                            AppAsset.images.logoLamaKoperasi,
                            height: 54.sp,
                          ),
                        ),
                        SizedBox(width: 8.sp),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Selamat Datang",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              "Raka",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.alarm),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
