
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/gen/colors.gen.dart';

import '../../../constants/text_font_style.dart';
import '../../../helpers/ui_helpers.dart';

class SubscriptionTextTile extends StatelessWidget {
  final String title, description;
  const SubscriptionTextTile({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(Assets.icons.doneSign),
          UIHelper.horizontalSpace(10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextFontStyle.headline16c666666tyleMontserratW600
                      .copyWith(color: AppColors.c1E1E1E),
                ),
                UIHelper.verticalSpace(15.w),
                Text(
                  description,
                  style: TextFontStyle.headline16c333333tyleMontserratW500
                      .copyWith(color: AppColors.c979797, fontSize: 16.sp),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
