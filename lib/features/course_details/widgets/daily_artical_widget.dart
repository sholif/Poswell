
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/common_widget/custom_network_image.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

class DailyArticalWidget extends StatelessWidget {
  final String imagePath, title, description;
  final bool isLastItem;
  const DailyArticalWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.isLastItem
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: UIHelper.kDefaulutPadding(),
          right: isLastItem? UIHelper.kDefaulutPadding():0
          ),
      child: SizedBox(
        height: 120.h,
        width: 205.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120.h,
              width: 205.h,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(5.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.c000000
                        .withOpacity(0.25),
                    blurRadius: 6.sp,
                    offset: const Offset(00, 1),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(5.r),
                  child: CustomNetworkImageWidget(urls: imagePath)
                  
                  // Image.asset(
                  //   dailyArticalList[index],
                  //   fit: BoxFit.cover,
                  // )
                  
                  ),
            ),
            UIHelper.verticalSpace(12.h),
    
            Text(
              title,
              style: TextFontStyle.headline16c666666tyleMontserratW600.copyWith(
                fontSize: 14.sp, color: AppColors.c57AE8F
              ),
            ),
            UIHelper.verticalSpace(6.h),
    
            Text(
              description,
              style: TextFontStyle.headline16c333333tyleMontserratW400.copyWith(
                fontSize: 14.sp, color: AppColors.cA7A7A7
              ),
            )
          ],
        ),
      ),
    );
  }
}
