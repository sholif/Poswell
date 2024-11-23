
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/common_widget/custom_network_image.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

class RecommendedCourseTileWidget extends StatelessWidget {
  final String title, imagePath, totlaModuld, totalMinuts;
  final Function() onTap;
  const RecommendedCourseTileWidget(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.totalMinuts,
      required this.totlaModuld,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100.h,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: AppColors.cFFFFFF,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                  color: AppColors.c000000.withOpacity(0.15),
                  offset: const Offset(0, 0),
                  blurRadius: 7.sp)
            ]),
        margin: EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
        child: Row(
          children: [
            SizedBox(
              width: 120.w,
              height: 100.h,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    bottomLeft: Radius.circular(10.r),
                  ),
                  child: CustomNetworkImageWidget(urls: imagePath)
                  // SvgPicture.asset(
                  //   imagePath,
                  //   fit: BoxFit.cover,
                  //   height: 100.h,
                  //   width: 140.w,
                  // )
                  
                  ),
            ),
            UIHelper.horizontalSpace(10.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextFontStyle.headline40cBE5F4FStyleMulishW600
                        .copyWith(
                            fontSize: 16.sp, color: AppColors.allPrimaryColor),
                  ),
                  UIHelper.verticalSpace(16.h),
                  Text(
                    "$totlaModuld Modules  ||  $totalMinuts Minutes",
                    style: TextFontStyle.headline16c333333tyleMontserratW500
                        .copyWith(fontSize: 14.sp, color: AppColors.c959595),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
