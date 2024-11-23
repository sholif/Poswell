import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/colors.gen.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: 167.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(color: AppColors.c57AE8F, width: 2.sp)),
      alignment: Alignment.center,
      child: Text(
        "Poswell",
        style: TextFontStyle.headline16c333333tyleMontserratW500
            .copyWith(color: AppColors.c57AE8F, fontSize: 32.sp),
      ),
    );
  }
}
