import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/common_widget/custom_app_bar.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

class JournalDetailsScreen extends StatelessWidget {
  const JournalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UIHelper.verticalSpace(25.h),
          CustomAppbar(
            showBack: true,
            name: "Journal",
            trailingWidget: SvgPicture.asset(Assets.icons.moreIcon),
          ),
          Expanded(
            child: ListView(
                          padding:
                EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
                physics: const BouncingScrollPhysics(),
              children: [
                UIHelper.verticalSpace(24.h),
                Text(
                  "25 May 2023",
                  style: TextFontStyle.headline16c333333tyleMontserratW400
                      .copyWith(fontSize: 14.sp, color: AppColors.c141414),
                ),
                UIHelper.verticalSpace(24.h),
                Text(
                  "losing my job For losing my job For losing my job",
                  style: TextFontStyle.headline16c666666tyleMontserratW600
                      .copyWith(fontSize: 18.sp, color: AppColors.c141414),
                ),
                UIHelper.verticalSpace(24.h),
                Text(
                  "Today, I found myself reflecting on the power of kindness. It's something that seems so simple and yet, can be incredibly difficult to practice, especially in a world that can often feel harsh and unkind. Today, I found myself reflecting on the power of kindness. It's something that seems so simple and yet, can be incredibly difficult to practice, especially in a world that can often feel harsh and unkind. Today, I found myself reflecting on the power of kindness. It's something that seems so simple and yet, can be incredibly difficult to practice, especially in a world that can often feel harsh and unkind. It's something that seems so simple and yet, can be incredibly difficult to practice, especially in a world that can often feel harsh and unkind. Today, I found myself reflecting on the power of kindness. It's something that seems so simple and yet, can be incredibly difficult to practice, especially in a world that can often feel harsh and unkind. It's something that seems so simple and yet, can be incredibly difficult to practice, especially in a world that can often feel harsh and unkind. Today, I found myself reflecting on the power of kindness. It's something that seems so simple and yet, can be incredibly difficult to practice, especially in a world that can often feel harsh and unkind. Today, I found myself reflecting on the power of kindness. It's something that seems so simple and yet, can be incredibly difficult to practice, especially in a world that can often feel harsh and unkind. Today, I found myself reflecting on the power of kindness. It's something that seems so simple and yet, can be incredibly difficult to practice, especially in a world that can often feel harsh and unkind. Today, I found myself reflecting on the power of kindness. It's something that seems so simple and yet, can be incredibly difficult to practice, especially in a world that can often feel harsh and unkind. It's something that seems so simple and yet, can be incredibly difficult to practice, especially in a world that can often feel harsh and unkind. Today, I found myself reflecting on the power of kindness. It's something that seems so simple and yet, can be incredibly difficult to practice, especially in a world that can often feel harsh and unkind. It's something that seems so simple and yet, can be incredibly difficult to practice, especially in a world that can often feel harsh and unkind. Today, I found myself reflecting on the power of kindness. It's something that seems so simple and yet, can be incredibly difficult to practice, especially in a world that can often feel harsh and unkind.",
                  style: TextFontStyle.headline16c333333tyleMontserratW400
                      .copyWith(fontSize: 16.sp, color: AppColors.c5A5C5F),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
