import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

class ReminderAlertScreen extends StatefulWidget {
  const ReminderAlertScreen({super.key});

  @override
  State<ReminderAlertScreen> createState() => _ReminderAlertScreenState();
}

class _ReminderAlertScreenState extends State<ReminderAlertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.images.reminderAlertBg.path),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.images.reminderClock.path,
              height: 156.h,
              width: 240.w,
            ),
            UIHelper.verticalSpace(65.h),
            Stack(
              children: [
                Container(
                  height: 90.h,
                  width: double.maxFinite,
                  margin: EdgeInsets.symmetric(
                      horizontal: UIHelper.kDefaulutPadding()),
                  decoration: BoxDecoration(
                      color: AppColors.cFFFFFF,
                      borderRadius: BorderRadius.circular(13.r)),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: 75.h,
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(
                        horizontal: UIHelper.kDefaulutPadding()),
                    decoration: BoxDecoration(
                        color: AppColors.cFFFFFF,
                        borderRadius: BorderRadius.circular(13.r),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.c000000.withOpacity(0.15),
                              offset: const Offset(00, 02),
                              blurRadius: 4.sp)
                        ]),
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w
                        ),
                    child: Row(
                      children: [
                        Text(
                          "😘",
                          style: TextStyle(fontSize: 20.sp),
                        ),
                        UIHelper.horizontalSpace(10.w),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good Morning",
                              style: TextFontStyle
                                  .headline16c333333tyleMontserratW500
                                  .copyWith(
                                      color: AppColors.allPrimaryColor,
                                      fontSize: 16.sp),
                            ),
                            UIHelper.verticalSpace(8.w),
                            Text(
                              "I will never compare my self to others.",
                              style: TextFontStyle
                                  .headline16c333333tyleMontserratW500
                                  .copyWith(
                                      color: AppColors.c616161,
                                      fontSize: 14.sp),
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
