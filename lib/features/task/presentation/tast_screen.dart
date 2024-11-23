import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/all_routes.dart';
import 'package:poswell_app/helpers/navigation_service.dart';

import '../../../common_widget/auth_button.dart';
import '../../../common_widget/custom_app_bar.dart';
import '../../../common_widget/custom_text_input.dart';
import '../../../helpers/ui_helpers.dart';

class TaskScren extends StatelessWidget {
  const TaskScren({super.key});

  static List<String> questionList = [
    "What is the capital city of France?",
    "Solve for x: 3x + 5 = 14.",
    "Which of the following is a chemical element?",
    "In which year did World War II end?",
    "Which planet is known as the Red Planet?"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UIHelper.verticalSpace(25.h),
          CustomAppbar(
            showBack: true,
            name: "Autonomy",
            trailingWidget: SvgPicture.asset(
              Assets.images.course1,
              width: 40.w,
              fit: BoxFit.cover,
            ),
          ),
          UIHelper.verticalSpace(25.h),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
              child: ListView(
                children: [
                  Text(
                    "Answer the question",
                    style: TextFontStyle.headline16c666666tyleMontserratW600
                        .copyWith(color: AppColors.c1E1E1E, fontSize: 16.sp),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: questionList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 40.w, bottom: 5.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${index + 1}. ",
                                style: TextFontStyle
                                    .headline16c333333tyleMontserratW500
                                    .copyWith(
                                        color: AppColors.c979797,
                                        fontSize: 14.sp),
                              ),
                              Expanded(
                                child: Text(
                                  questionList[index],
                                  style: TextFontStyle
                                      .headline16c333333tyleMontserratW500
                                      .copyWith(
                                          color: AppColors.c979797,
                                          fontSize: 14.sp),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                  UIHelper.verticalSpace(24.h),
                  Text(
                    "N.B: write the question in the answer box or submit a google docs link",
                    style: TextFontStyle.headline16c333333tyleMontserratW500
                        .copyWith(color: AppColors.c4E4E4E),
                  ),
                  UIHelper.verticalSpace(16.h),
                  CustomFormField(
                    inputType: TextInputType.name,
                    title: "URL",
                    hintText: "submit link",
                    
                  ),
                  UIHelper.verticalSpace(16.h),
                  CustomFormField(
                    inputType: TextInputType.name,
                    title: "Answer",
                    hintText: "Write the answer here",
                    maxline: 10,
                    
                  ),
            
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
        child: AuthCustomeButton(
              onCallBack: () {
                // NavigationService.navigateToWithArgs(Routes.subscriptionScreen, {'data': true});
                NavigationService.navigateTo(Routes.congratulationScreen);
              },
              name: "Submit",
              height: 45.h,
              minWidth: double.maxFinite,
              borderRadius: 5.r,
              color: AppColors.allPrimaryColor,
              textStyle: TextFontStyle
                  .headline16c666666tyleMontserratW600
                  .copyWith(color: AppColors.cFFFFFF),
              context: context),
      ),
    );
  }
}
