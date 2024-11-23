import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/all_routes.dart';
import 'package:poswell_app/helpers/navigation_service.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 250.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Assets.images.reminderScreenBg.path),
                        fit: BoxFit.cover)),
                        padding: EdgeInsets.symmetric(
                          horizontal: UIHelper.kDefaulutPadding()
                        ),
                        child: Column(
                          children: [
                            UIHelper.verticalSpace(60.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SvgPicture.asset(Assets.icons.backArrow, color: AppColors.cFFFFFF,),
                                // UIHelper.horizontalSpace(100.w),
                                Text(
                                  "Reminder",
                                  style: TextFontStyle.headline16c666666tyleMontserratW600.copyWith(
                                    color: AppColors.cFFFFFF, fontSize: 18.sp
                                  ),
                                  )
                              ],
                            )
                          ],
                        ),
              ),
            ],
          ),
          Positioned(
              top: 150.h.h,
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: AppColors.cFFFFFF,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    )),
                child: ListView(
                  children: [
                    ListView.builder(
                        itemCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const ReminderTileWidget();
                        }),
                    UIHelper.verticalSpace(24.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: (){
                          NavigationService.navigateTo(Routes.addReminderScreen);
                        },
                        child: Container(
                          width: 165.w,
                          height: 40.h,
                          margin:
                              EdgeInsets.only(left: UIHelper.kDefaulutPadding()),
                          decoration: BoxDecoration(
                              color: AppColors.allPrimaryColor,
                              borderRadius: BorderRadius.circular(38.r)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add_rounded, color: AppColors.cFFFFFF,size: 24.sp, ),
                                  UIHelper.horizontalSpace(8.w),
                                  Text(
                                    "Set Reminder",
                                    style: TextFontStyle.headline16c292929StyleOpenSenseW600.copyWith(
                                      color: AppColors.cFFFFFF, fontSize: 14.sp
                                    ),
                                    ),
                                ],
                              ),
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class ReminderTileWidget extends StatelessWidget {
  const ReminderTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Column(
        children: [
          Container(
            height: 60.h,
            width: double.maxFinite,
            padding:
                EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
            child: Row(
              children: [
                Flexible(
                  child: SizedBox(
                    height: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning",
                          style: TextFontStyle
                              .headline16c666666tyleMontserratW600
                              .copyWith(
                                  color: AppColors.c57AE8E, fontSize: 14.sp),
                        ),
                        UIHelper.verticalSpace(4.h),
                        Text(
                          "A food, B light & sound, C contact friend, D clean ",
                          style: TextFontStyle
                              .headline16c333333tyleMontserratW400
                              .copyWith(
                                  color: AppColors.c616161, fontSize: 14.sp),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 100.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "18.05.2023",
                        style: TextFontStyle.headline16c292929StyleOpenSenseW600
                            .copyWith(
                                color: AppColors.c424242, fontSize: 14.sp),
                      ),
                      UIHelper.verticalSpace(4.h),
                      Text(
                        "15:00",
                        style: TextFontStyle.headline16c292929StyleOpenSenseW600
                            .copyWith(
                                color: AppColors.c424242, fontSize: 14.sp),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 50.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(Assets.icons.editIcon),
                      SvgPicture.asset(Assets.icons.deleteIcon),
                    ],
                  ),
                )
              ],
            ),
          ),
          UIHelper.customDivider()
        ],
      ),
    );
  }
}
