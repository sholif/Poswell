import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';
import 'gen/assets.gen.dart';

final class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration:  BoxDecoration(
          image: DecorationImage(image: AssetImage(Assets.images.splashBg.path), fit: BoxFit.cover)
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      "PosWell",
                      style: TextFontStyle.headline40cBE5F4FStyleMulishW600,
                      ),
                      UIHelper.verticalSpace(5.h),
                    Text(
                      "Unlocking Your Inner Wellness\nPotential",
                      textAlign: TextAlign.center,
                      style: TextFontStyle.headline40cBE5F4FStyleMulishW600.copyWith(
                        fontSize: 20.sp
                      ),
                      ),
                  ],
                )
              ),
              SizedBox(
                height: 20.h,
              ),
            ]),
      ),
    );
  }
}
