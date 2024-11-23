import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/all_routes.dart';
import 'package:poswell_app/helpers/navigation_service.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

import '../../common_widget/auth_button.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.images.congratulationsImage),
          UIHelper.verticalSpace(45.h),
          Text(
            "Successfully Completed the Task!",
            style: TextFontStyle.headline16c666666tyleMontserratW600
                .copyWith(color: AppColors.c1E1E1E, fontSize: 16.sp),
          ),
          UIHelper.verticalSpace(8.h),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding() ),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text:
                          'Congratulations! you have successfully completed the task and you got a ',
                      style: TextFontStyle.headline16c333333tyleMontserratW400
                          .copyWith(color: AppColors.c737791, fontSize: 12.sp)),
                  TextSpan(
                      text: 'pro badge.',
                      style: TextFontStyle.headline16c666666tyleMontserratW600
                          .copyWith(color: AppColors.c737791, fontSize: 12.sp)),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          UIHelper.verticalSpace(45.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding() ),
            child: AuthCustomeButton(
                onCallBack: () {
                  NavigationService.navigateTo(Routes.authScreen);
                },
                name: "Claim",
                height: 45.h,
                minWidth: double.maxFinite,
                borderRadius: 5.r,
                color: AppColors.allPrimaryColor,
                textStyle: TextFontStyle
                    .headline16c666666tyleMontserratW600
                    .copyWith(color: AppColors.cFFFFFF),
                context: context),
          )

        ],
      ),
    );
  }
}
