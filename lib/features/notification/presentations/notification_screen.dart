import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/helpers/navigation_service.dart';

import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          UIHelper.verticalSpace(45.h),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
            child: Row(
              children: [
                InkWell(
                    onTap: () => NavigationService.goBack,
                    child: SvgPicture.asset(
                      Assets.icons.backArrow,
                    )),
                UIHelper.horizontalSpace(110.w),
                Text(
                  "Notification",
                  style: TextFontStyle.headline16c666666tyleMontserratW600
                      .copyWith(fontSize: 18.sp, color: AppColors.c1E1E1E),
                ),
              ],
            ),
          ),
          UIHelper.verticalSpace(24.h),
          Expanded(child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: UIHelper.kDefaulutPadding()
            ),
            itemCount: 10,
            itemBuilder: (context, index){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(index ==0) Text(
                    "Today",
                    style: TextFontStyle.headline16c666666tyleMontserratW600.copyWith(
                      color: AppColors.c1E1E1E, fontSize: 16.sp
                    ),
                    ),
                  if(index ==4) Padding(
                    padding:  EdgeInsets.symmetric(vertical: 10.h),
                    child: Text(
                      "Yesterday",
                      style: TextFontStyle.headline16c666666tyleMontserratW600.copyWith(
                        color: AppColors.c1E1E1E, fontSize: 16.sp
                      ),
                      ),
                  ),

                    Container(
                      width: double.maxFinite, height: 80.h,
                      margin: EdgeInsets.symmetric(
                        vertical: 8.h
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.cFFFFFF,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.c000000.withOpacity(0.15),
                            blurRadius: 8.sp,
                            offset: const Offset(00, 01)
                          )
                        ]
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.h, vertical: 15.h
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 50.h, width: 50.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle, 
                              border: Border.all(
                                color: AppColors.c000000
                              )
                            ),
                          ),
                          UIHelper.horizontalSpace(14.h),
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UIHelper.verticalSpace(4.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Lorem Ipsum",
                                    style: TextFontStyle.headline16c666666tyleMontserratW600.copyWith(
                                      color: AppColors.c1E1E1E, fontSize: 16.sp
                                    ),
                                    ),
                                  Text(
                                    "2 min ago",
                                    style: TextFontStyle.headline16c666666tyleMontserratW600.copyWith(
                                      color: AppColors.c1E1E1E, fontSize: 12.sp
                                    ),
                                    ),
                                ],
                              ),
                              UIHelper.verticalSpace(8.h),
                              Text(
                                "Lorem ipsum demo text used here",
                                style: TextFontStyle.headline16c333333tyleMontserratW500.copyWith(
                                  fontSize: 12.sp, color: AppColors.cB1B1B1
                                ),
                              )
                            ],
                          ))
                        ],
                      ),
                    )
                ],
              );
            }
            ))
        ],
      ),
    );
  }
}