import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/app_asset.dart';

class AppHomeWrapper extends StatelessWidget {
  const AppHomeWrapper({
    super.key,
    required this.child,
    this.ableToBack = false,
  });

  final Widget child;
  final bool ableToBack;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 64.sp,
          actionsPadding: EdgeInsets.all(12.sp),
          actions: [
            Material(
              borderRadius: BorderRadius.circular(99),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(99),
                child: Container(
                  padding: EdgeInsets.all(6.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99),
                    color: Color(0xFFCECECE).withOpacity(0.4),
                  ),
                  child: SvgPicture.asset(AppAsset.svgs.notificationBlack),
                ),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          surfaceTintColor: Colors.white,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                child: Image.asset(
                  AppAsset.images.logoLamaKoperasi,
                  height: 42.sp,
                ),
              ),
              SizedBox(width: 8.sp),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Selamat Datang",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    "Raka",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
          child: child,
        ),
      ),
    );
  }
}
