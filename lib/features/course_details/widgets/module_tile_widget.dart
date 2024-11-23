

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

class ModuleTileWidget extends StatelessWidget {
  final String title, duration, moduleNumber;
  final bool isAccessable, isTask;
  const ModuleTileWidget(
      {super.key,
      required this.title,
      required this.isAccessable,
      required this.duration,
      required this.moduleNumber,
      required this.isTask
      
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIHelper.verticalSpace(5.h),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
          child: Text(
            "Module $moduleNumber ${isTask? "(Task)":""}",
            style: TextFontStyle.headline16c666666tyleMontserratW600
                .copyWith(color: AppColors.c1E1E1E, fontSize: 16.sp),
          ),
        ),
        Container(
          height: 61.h,
          width: double.maxFinite,
          margin: EdgeInsets.symmetric(
              vertical: 12.h, horizontal: UIHelper.kDefaulutPadding()),
          decoration: BoxDecoration(
            color: isTask? AppColors.allPrimaryColor  : AppColors.cFFFFFF,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
                color: isAccessable
                    ? AppColors.allPrimaryColor
                    : Colors.transparent),
            boxShadow: [
              BoxShadow(
                color: AppColors.c000000.withOpacity(0.15),
                blurRadius: 4.sp,
                spreadRadius: 0,
              )
            ],
          ),
          padding: EdgeInsets.symmetric(
              horizontal: UIHelper.kDefaulutPadding(), vertical: 12.h),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextFontStyle.headline16c666666tyleMontserratW600
                      .copyWith(color: isTask? AppColors.cFFFFFF : AppColors.c57AE8F, fontSize: 14.sp),
                ),
              ),
              isAccessable
                  ? Text(
                      duration,
                      style: TextFontStyle.headline16c333333tyleMontserratW500
                          .copyWith(color: AppColors.cA6A6A6, fontSize: 14.sp),
                    )
                  : SvgPicture.asset(
                      Assets.icons.lock,
                    )
            ],
          ),
        ),
      ],
    );
  }
}
