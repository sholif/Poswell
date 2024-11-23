
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/features/subscription/widgets/subscription_tile_widget.dart';
import 'package:poswell_app/helpers/all_routes.dart';
import 'package:poswell_app/helpers/navigation_service.dart';

import '../../../common_widget/auth_button.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';

class FreeTrailWidget extends StatelessWidget {
  const FreeTrailWidget({
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
          margin: EdgeInsets.symmetric(
              horizontal: UIHelper.kDefaulutPadding()),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.cFFFFFF,
              boxShadow: [
                BoxShadow(
                    color: AppColors.c000000.withOpacity(0.25),
                    offset: const Offset(0, 0),
                    blurRadius: 7.sp)
              ]
              ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Pos-Well ",
                        style: TextFontStyle
                            .headline16c292929StyleOpenSenseW600
                            .copyWith(
                                color: AppColors.cFFFFFF,
                                fontSize: 24.sp)),
                    Text("(7 Days Free Trail)",
                        style: TextFontStyle
                            .headline16c292929StyleOpenSenseW600
                            .copyWith(
                                color: AppColors.cFFFFFF,
                                fontSize: 16.sp)),
                  ],
                ),
              ),
              UIHelper.verticalSpace(22.h),
              const SubscriptionTextTile(
                title: "Access to Basic Features: ",
                description:
                    "You will have access to a range of fundamental features designed to support your psychological wellness, including mood tracking and self-reflection prompts.",
              ),
              UIHelper.verticalSpace(22.h),
              const SubscriptionTextTile(
                title: "Limited Content Library: ",
                description:
                    "Explore a selection of articles, tips, and resources on topics such as stress management, self-care, and building resilience.",
              ),
              UIHelper.verticalSpace(22.h),
              const SubscriptionTextTile(
                title: "Comprehensive Evaluation: ",
                description:
                    "Our assessment covers various aspects of your psychological well-being, including self acceptance, environmental mastery, autonomy, positive relations, and more. It provides a holistic view of your current state of psychological well-being.",
              ),
              UIHelper.verticalSpace(22.h),
              const SubscriptionTextTile(
                title: "Personalized Recommendations: ",
                description:
                    "Based on your assessment results, we provide you with personalized recommendations tailored to your specific needs. These recommendations are designed to help you enhance your well-being and make positive wellness changes.",
              ),
              UIHelper.verticalSpace(22.h),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '7 Days free trail ',
                  style: TextFontStyle.headline16c333333tyleMontserratW500
                      .copyWith(color: AppColors.allPrimaryColor),
                ),
              ),
              UIHelper.verticalSpace(22.h),
    
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding() ),
                child: AuthCustomeButton(
                    onCallBack: () {
                      NavigationService.navigateTo(Routes.choseCourseScreen);
                    },
                    name: "Continue",
                    height: 45.h,
                    minWidth: double.maxFinite,
                    borderRadius: 5.r,
                    color: AppColors.allPrimaryColor,
                    textStyle: TextFontStyle
                        .headline16c666666tyleMontserratW600
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