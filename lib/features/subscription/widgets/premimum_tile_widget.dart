import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/common_widget/auth_button.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/features/subscription/widgets/subscription_tile_widget.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

class PremimumTileWidget extends StatelessWidget {
  const PremimumTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
          // color: Colors.black.withOpacity(0.3),
          margin: EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.cFFFFFF,
              boxShadow: [
                BoxShadow(
                    color: AppColors.c000000.withOpacity(0.25),
                    offset: const Offset(0, 0),
                    blurRadius: 7.sp)
              ]),
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                height: 78.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: AppColors.allPrimaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      topRight: Radius.circular(8.r),
                    )),
                // alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 44.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Pos-Well ",
                        style: TextFontStyle.headline16c292929StyleOpenSenseW600
                            .copyWith(
                                color: AppColors.cFFFFFF, fontSize: 24.sp)),
                    Text("(Premium)",
                        style: TextFontStyle.headline16c292929StyleOpenSenseW600
                            .copyWith(
                                color: AppColors.cFFFFFF, fontSize: 16.sp)),
                  ],
                ),
              ),
              UIHelper.verticalSpace(22.h),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: UIHelper.kDefaulutPadding()),
                child: Text(
                  "In addition to the features offered in the free plan, the premium plan provides enhanced functionality and access to exclusive content. ",
                  textAlign: TextAlign.center,
                  style: TextFontStyle.headline16c333333tyleMontserratW500
                      .copyWith(fontSize: 16.sp, color: AppColors.c979797),
                ),
              ),
              UIHelper.verticalSpace(22.h),
              const SubscriptionTextTile(
                title: "Comprehensive Content Library: ",
                description:
                    "Wellness Seekers gain unlimited access to an extensive library of articles covering a wide range of topics, including mindfulness, emotional intelligence, relationships, and personal growth.",
              ),
              UIHelper.verticalSpace(22.h),
              const SubscriptionTextTile(
                title: "Personalized Insights and Recommendations:",
                description:
                    "Wellness Seekers receive personalized insights and recommendations based on their usage patterns and goals, providing tailored support for their specific needs.",
              ),
              UIHelper.verticalSpace(22.h),
              const SubscriptionTextTile(
                title: "Progress Tracking and Analytics",
                description:
                    "Users can track their progress over time, access detailed analytics, and gain insights into their well-being journey.",
              ),
              UIHelper.verticalSpace(22.h),
              Align(
                alignment: Alignment.center,
                child: Text(
                  r'$70',
                  style: TextFontStyle.headline16c333333tyleMontserratW400
                      .copyWith(
                          color: AppColors.allPrimaryColor, fontSize: 28.sp),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '6 Months',
                  style: TextFontStyle.headline16c333333tyleMontserratW500
                      .copyWith(color: AppColors.allPrimaryColor),
                ),
              ),
              UIHelper.verticalSpace(22.h),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: UIHelper.kDefaulutPadding()),
                child: AuthCustomeButton(
                    onCallBack: () {},
                    name: "Continue",
                    height: 45.h,
                    minWidth: double.maxFinite,
                    borderRadius: 5.r,
                    color: AppColors.allPrimaryColor,
                    textStyle: TextFontStyle.headline16c666666tyleMontserratW600
                        .copyWith(color: AppColors.cFFFFFF),
                    context: context),
              ),
              UIHelper.verticalSpace(12.h),
            ],
          ),
        ),
        UIHelper.verticalSpace(20.h),
      ],
    ));
  }
}
