import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/common_widget/custom_app_bar.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/features/goal_details/widgets/custom_circular_goal_progress_widget.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

class GoalDetailsScreen extends StatelessWidget {
  const GoalDetailsScreen({super.key});

  static List<String> category = ["ALL", "Module", "Task", "Article"];
  final String seletedTitle = "ALL";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          const CustomCircularGoalProgressWidget(
            month: "Feb",
            year: "2024",
            totalPercentage: 43,
          ),
          // Padding(
          //   padding:
          //       EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       SvgPicture.asset(Assets.icons.leftArrow),
          //       const CustomCircularGoalProgressWidget(
          //         month: "Feb", year: "2024", totalPercentage: 43,
          //       ),
          //       SvgPicture.asset(Assets.icons.rightArrrow),
          //     ],
          //   ),
          // ),
          UIHelper.verticalSpace(30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomGoalMiniCardWidget(
                title: "Module",
                completePercentage: 20,
              ),
              UIHelper.horizontalSpace(30.h),
              const CustomGoalMiniCardWidget(
                title: "Task",
                completePercentage: 80,
              ),
              UIHelper.horizontalSpace(30.h),
              const CustomGoalMiniCardWidget(
                title: "Article",
                completePercentage: 49,
              ),
            ],
          ),
          UIHelper.verticalSpace(30.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: category.map((e) {
              return e == seletedTitle
                  ? CustomGoalTabWidget(
                      title: e,
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        e,
                        style: TextFontStyle.headline16c666666tyleMontserratW600
                            .copyWith(
                          color: AppColors.c666666,
                        ),
                      ),
                    );
            }).toList(),
          ),

          UIHelper.verticalSpace(15.h),

          Expanded(
            child: ListView.builder(
                itemCount: 10,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIHelper.verticalSpace(5.h),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: UIHelper.kDefaulutPadding()),
                        child: Text(
                          "Clarifying Personal Beliefs and Values",
                          style: TextFontStyle
                              .headline16c333333tyleMontserratW500
                              .copyWith(
                                  color: AppColors.c000000, fontSize: 14.sp),
                        ),
                      ),
                      UIHelper.verticalSpace(5.h),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: UIHelper.kDefaulutPadding()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "2024.02.18",
                              style: TextFontStyle
                                  .headline16c333333tyleMontserratW400
                                  .copyWith(
                                      color: AppColors.c686868,
                                      fontSize: 10.sp),
                            ),
                            Text(
                              "10",
                              style: TextFontStyle
                                  .headline16c333333tyleMontserratW500
                                  .copyWith(
                                      color: AppColors.c149C21,
                                      fontSize: 16.sp),
                            ),
                          ],
                        ),
                      ),
                      UIHelper.verticalSpace(5.h),
                      UIHelper.customDivider()
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}

class CustomGoalTabWidget extends StatelessWidget {
  final String title;
  const CustomGoalTabWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 77.w,
      height: 33.h,
      decoration: ShapeDecoration(
        color: AppColors.c57AE8F,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        shadows: [
          BoxShadow(
            color: AppColors.c000000.withOpacity(0.18),
            blurRadius: 6,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 5.h),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextFontStyle.headline16c666666tyleMontserratW600.copyWith(
          color: AppColors.cFFFFFF,
        ),
      ),
    );
  }
}

class CustomGoalMiniCardWidget extends StatelessWidget {
  final String title;
  final double completePercentage;
  const CustomGoalMiniCardWidget({
    super.key,
    required this.title,
    required this.completePercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64.h,
      height: 80.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadows: [
          BoxShadow(
            color: AppColors.c000000.withOpacity(0.10),
            blurRadius: 16.sp,
            offset: const Offset(0, 4),
            spreadRadius: -1,
          )
        ],
      ),
      padding: EdgeInsets.all(7.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UIHelper.verticalSpace(5.h),
          Text(
            title,
            style: TextFontStyle.headline16c333333tyleMontserratW400
                .copyWith(fontSize: 10.sp, color: AppColors.c506060),
          ),
          UIHelper.verticalSpace(4.h),
          Text(
            "$completePercentage%",
            style: TextFontStyle.headline16c333333tyleMontserratW400
                .copyWith(fontSize: 15.sp, color: AppColors.c000000),
          ),
          UIHelper.verticalSpace(4.h),
          LinearProgressIndicator(
            value: completePercentage / 100,
            backgroundColor: AppColors.cF2F2F2,
            color: AppColors.c000000,
            borderRadius: BorderRadius.circular(8.r),
          )
        ],
      ),
    );
  }
}
