import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/all_routes.dart';
import 'package:poswell_app/helpers/navigation_service.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

import '../../../constants/text_font_style.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              UIHelper.verticalSpace(45.h),
              Text(
                "Journal",
                style: TextFontStyle.headline16c666666tyleMontserratW600
                    .copyWith(color: AppColors.c1E1E1E, fontSize: 18.sp),
              ),
              UIHelper.verticalSpace(10.h),
              Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            NavigationService.navigateTo(Routes.journalDetailsScreen);
                          },
                          child: SizedBox(
                            height: 100.h,
                            width: double.maxFinite,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: UIHelper.kDefaulutPadding(),
                                right: UIHelper.kDefaulutPadding(),
                                top: 8.h,
                                bottom: index == 9 ? 120.h : 8.h,
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(13.r),
                                      child: Image.asset(
                                        Assets.images.journalImg.path,
                                        height: 100.h,
                                        width: 100.h,
                                        fit: BoxFit.cover,
                                      )),
                                  UIHelper.horizontalSpace(12.w),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Boosting Your  Productivity at Work",
                                        style: TextFontStyle
                                            .headline16c666666tyleMontserratW600
                                            .copyWith(
                                                color: AppColors.c141414,
                                                fontSize: 18.sp),
                                      ),
                                      // Spacer(),
                                      UIHelper.verticalSpace(12.h),
                          
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Today",
                                            style: TextFontStyle
                                                .headline16c333333tyleMontserratW400
                                                .copyWith(
                                                    fontSize: 12.sp,
                                                    color: AppColors.c57AE8F),
                                          ),
                                          SvgPicture.asset(Assets.icons.moreIcon)
                                        ],
                                      )
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      })),
            ],
          ),
          Positioned(
              bottom: 120.h, right: 0, child: const AddJournalFloatingButton())
        ],
      ),
    );
  }
}

class AddJournalFloatingButton extends StatelessWidget {
  const AddJournalFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        NavigationService.navigateTo(Routes.addJournalScreen);
      },
      child: Container(
        height: 45.h,
        width: 160.w,
        decoration: BoxDecoration(
            color: AppColors.allPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              bottomLeft: Radius.circular(15.r),
            )),
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          children: [
            Container(
              height: 33.h,
              width: 33.h,
              decoration: BoxDecoration(
                  color: AppColors.cFFDC64,
                  borderRadius: BorderRadius.circular(10.r)),
              alignment: Alignment.center,
              child: const Icon(
                Icons.add_rounded,
                color: AppColors.c000000,
              ),
            ),
            UIHelper.horizontalSpace(10.w),
            Text(
              "Add Journal",
              style: TextFontStyle.headline16c666666tyleMontserratW600
                  .copyWith(color: AppColors.cFFFFFF, fontSize: 14.sp),
            )
          ],
        ),
      ),
    );
  }
}
