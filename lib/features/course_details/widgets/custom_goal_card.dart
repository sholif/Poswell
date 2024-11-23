
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/helper_methods.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

class CustomGoalCard extends StatelessWidget {
  final int totalCourses, completeCourses;
  const CustomGoalCard({
    super.key,
    required this.totalCourses, 
    required this.completeCourses
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.all(24.h),
      decoration: BoxDecoration(
          color: AppColors.cF8F8F8,
          borderRadius: BorderRadius.circular(14.sp)),
      padding:
          EdgeInsets.symmetric(vertical: 19.h, horizontal: 16.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "On going Goals",
                style: TextFontStyle
                    .headline16c666666tyleMontserratW600
                    .copyWith(color: AppColors.c263238),
              ),
              SvgPicture.asset(Assets.icons.arrowRight)
            ],
          ),
          UIHelper.verticalSpace(14.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${calculateCompletionPercentage(totalCourses: totalCourses, completedCourses: completeCourses ).toStringAsFixed(0)}%",
                style: TextFontStyle.headline16c666666tyleMontserratW700
                    .copyWith(color: AppColors.c000000, fontSize: 24.sp ),
              ),
              Text(
                "$completeCourses from $totalCourses lessons",
                style: TextFontStyle.headline16c333333tyleMontserratW500
                    .copyWith(color: AppColors.c8993A4, fontSize: 12.sp ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(9.r),
                child: Container(
                  height: 41.h, width: 41.h,
                  color: AppColors.cFFFFFF, child: SvgPicture.asset(Assets.images.course1, height: 41.h, width: 41.h, fit: BoxFit.cover,)))
            ],
          ),
          UIHelper.verticalSpace(14.h),
          LinearProgressIndicator(
            backgroundColor: AppColors.cECECEC,
            color: AppColors.allPrimaryColor,
            minHeight: 12.h,
            value: calculateCompletionPercentage(totalCourses: totalCourses, completedCourses: completeCourses )/100,
            borderRadius: BorderRadius.circular(3.r),
          )
    
        ],
      ),
    );
  }
}
