
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

class CustomCircularGoalProgressWidget extends StatelessWidget {
  final String month, year;
  final double totalPercentage;
  const CustomCircularGoalProgressWidget({
    super.key,
    required this.month,
    required this.year,
    required this.totalPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190.h, width: 190.h,
      child:  DashedCircularProgressBar.aspectRatio(
        aspectRatio: 1, // width ÷ height
        progress: totalPercentage,
        startAngle: 162,
        sweepAngle: 325,
        foregroundColor: AppColors.c000000,
        backgroundColor: AppColors.c57AE8F,
        foregroundStrokeWidth: 22.h,
        backgroundStrokeWidth: 22.h,
        animation: true,
        seekSize: 6,
        seekColor: Colors.transparent,
        child: Container(
          margin: EdgeInsets.all(32.h),
          decoration: BoxDecoration(
            // color: Colors.blue,
            border: Border.all(
              color: AppColors.cF0F4F4
            ),
            shape: BoxShape.circle
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                month,
                style: TextFontStyle.headline16c333333tyleMontserratW500.copyWith(
                  color: AppColors.c506060, fontSize: 14.sp
                ),
              ),
              Text(
                year,
                style: TextFontStyle.headline16c333333tyleMontserratW400.copyWith(
                  color: AppColors.c506060, fontSize: 12.sp
                ),
              ),
              UIHelper.verticalSpace(5.h),
              Text(
                "${totalPercentage.toStringAsFixed(0)}%",
                style: TextFontStyle.headline16c666666tyleMontserratW600.copyWith(
                  color: AppColors.c002424, fontSize: 22.sp
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
