import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

class DailyAffermation extends StatefulWidget {
  const DailyAffermation({super.key});

  @override
  State<DailyAffermation> createState() => _DailyAffermationState();
}

class _DailyAffermationState extends State<DailyAffermation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.images.dailyAffimationBg.path),
                fit: BoxFit.cover)),
                padding: EdgeInsets.symmetric(
                  horizontal: UIHelper.kDefaulutPadding()
                ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "I will not compare my self to others",
              textAlign: TextAlign.center,
              style: TextFontStyle.headline16c666666tyleMontserratW600
                  .copyWith(color: AppColors.cFFFFFF, fontSize: 34.sp),
            ),
            UIHelper.verticalSpace(44.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.icons.favIcon),
                UIHelper.horizontalSpace(34.w),
                SvgPicture.asset(Assets.icons.shareIcon),
              ],
            )
          ],
        ),
      ),
    );
  }
}
