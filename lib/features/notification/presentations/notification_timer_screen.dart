import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/helpers/navigation_service.dart';

import '../../../common_widget/auth_button.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/ui_helpers.dart';

class NotificationTimerScreen extends StatefulWidget {
  const NotificationTimerScreen({super.key});

  @override
  State<NotificationTimerScreen> createState() => _NotificationTimerScreenState();
}

class _NotificationTimerScreenState extends State<NotificationTimerScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UIHelper.verticalSpace(45.h),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
            child: Row(
              children: [
                InkWell(
                    onTap: () => NavigationService.goBack,
                    child: SvgPicture.asset(
                      Assets.icons.backArrow,
                    )),
                UIHelper.horizontalSpace(90.w),
                Text(
                  "Daily Affirmation",
                  style: TextFontStyle.headline16c666666tyleMontserratW600
                      .copyWith(fontSize: 18.sp, color: AppColors.c1E1E1E),
                ),
              ],
            ),
          ),
          UIHelper.verticalSpace(24.h),
          Expanded(
              child: ListView(
            padding:
                EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
            children: [
              Text(
                "Once A Day",
                style: TextFontStyle.headline16c666666tyleMontserratW600
                    .copyWith(color: AppColors.c1E1E1E, fontSize: 18.sp),
              ),
              UIHelper.verticalSpace(9.h),
              customTIleWidget(isActive:  _selectedIndex ==0, onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });

              }),
              UIHelper.verticalSpace(12.h),
              Text(
                "Twice A day",
                style: TextFontStyle.headline16c666666tyleMontserratW600
                    .copyWith(color: AppColors.c1E1E1E, fontSize: 18.sp),
              ),
              UIHelper.verticalSpace(9.h),
              customTIleWidget(isActive:  _selectedIndex ==1, onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });

              }),
              UIHelper.verticalSpace(12.h),
              Text(
                "Thrice A Day",
                style: TextFontStyle.headline16c666666tyleMontserratW600
                    .copyWith(color: AppColors.c1E1E1E, fontSize: 18.sp),
              ),
              UIHelper.verticalSpace(9.h),
              customTIleWidget(isActive: _selectedIndex ==2, onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });

              })
            ],
          ))
        ],
      ),
       bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: UIHelper.kDefaulutPadding(), vertical: 10.h),
        child: AuthCustomeButton(
            onCallBack: () {
              NavigationService.navigateToReplacement(Routes.dailyAffermationScreen);
            },
            name: "Save Changes",
            height: 45.h,
            minWidth: double.maxFinite,
            borderRadius: 5.r,
            color: AppColors.allPrimaryColor,
            textStyle: TextFontStyle.headline16c666666tyleMontserratW600
                .copyWith(color: AppColors.cFFFFFF),
            context: context),
      ),
    );
  }

  InkWell customTIleWidget(
      {required bool isActive, required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 125.h,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: isActive ? AppColors.c57AE8F : AppColors.cFFFFFF,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
                color: isActive ? Colors.transparent : AppColors.c57AE8F),
            boxShadow: [
              BoxShadow(
                  color: AppColors.c000000.withOpacity(0.15),
                  blurRadius: 10.sp,
                  spreadRadius: 0)
            ]),
        child: SvgPicture.asset(
          Assets.images.notificationTileImg,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
