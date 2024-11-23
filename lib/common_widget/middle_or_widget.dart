
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

class MiddleOrWidget extends StatelessWidget {
  const MiddleOrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: UIHelper.customDivider(),
        ),
        UIHelper.horizontalSpace(15.w),
        Text(
          "Or",
          style: TextFontStyle.headline16c333333tyleMontserratW500.copyWith(
            fontSize: 12.sp,
            color: AppColors.cECECEC
          )
          ),
          UIHelper.horizontalSpace(15.w),
        Flexible(
          child: UIHelper.customDivider(),
        ),
      ],
    );
  }
}
