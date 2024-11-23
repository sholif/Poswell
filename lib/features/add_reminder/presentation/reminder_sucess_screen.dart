import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/all_routes.dart';
import 'package:poswell_app/helpers/navigation_service.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

import '../../../common_widget/auth_button.dart';

class ReminderSucessScreen extends StatelessWidget {
  const ReminderSucessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.images.splashBg.path),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                // Text("😘"),
                Column(
                  children: [
                    SizedBox(
                      height: 45.h,
                      width: double.maxFinite,
                    ),
                    Container(
                      height: 205.h,
                      width: double.maxFinite,
                      margin: EdgeInsets.symmetric(horizontal: 30.w),
                      decoration: BoxDecoration(
                          color: AppColors.cFFFFFF,
                          borderRadius: BorderRadius.circular(14.r),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.c000000.withOpacity(0.15),
                                offset: const Offset(00, 01),
                                blurRadius: 4.sp)
                          ]),
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: Column(
                        children: [
                          UIHelper.verticalSpace(55.h),
                          Text(
                            "Congrats!",
                            style: TextFontStyle
                                .headline16c666666tyleMontserratW600
                                .copyWith(color: AppColors.allPrimaryColor),
                          ),
                          UIHelper.verticalSpace(16.h),
                          Text(
                            "Congrats you have set a reminder!",
                            textAlign: TextAlign.center,
                            style: TextFontStyle
                                .headline16c333333tyleMontserratW500
                                .copyWith(
                                    color: AppColors.c616161, fontSize: 16.sp),
                          ),
                          UIHelper.verticalSpace(16.h),

                          AuthCustomeButton(
                              onCallBack: () {
                                NavigationService.navigateToReplacement(Routes.reminderScreen);
                              },
                              name: "Thanks",
                              height: 29.h,
                              minWidth: 88.w,
                              borderRadius: 5.r,
                              color: AppColors.allPrimaryColor,
                              textStyle: TextFontStyle
                                  .headline16c666666tyleMontserratW600
                                  .copyWith(color: AppColors.cFFFFFF),
                              context: context)
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 86.h,
                      width: 86.h,
                      decoration: const BoxDecoration(
                          color: AppColors.cFFFFFF, shape: BoxShape.circle),
                      alignment: Alignment.center,
                      child: Text(
                        "😘",
                        style: TextFontStyle.headline16c666666tyleMontserratW700
                            .copyWith(fontSize: 40.sp),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
