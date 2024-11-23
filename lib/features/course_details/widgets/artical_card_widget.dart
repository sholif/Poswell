
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/common_widget/custom_network_image.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

class ArticalCartWidget extends StatelessWidget {
  final String title, description, imagePath;
  final Function() onTap;

  const ArticalCartWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.description,
    required this.imagePath,
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 100.h,
            width: 100.h,
            margin: EdgeInsets.symmetric(
                vertical: 8.h, horizontal: UIHelper.kDefaulutPadding()),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.c000000.withOpacity(0.25),
                  blurRadius: 6.sp,
                  offset: const Offset(00, 1),
                  spreadRadius: 0,
                )
              ],
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: CustomNetworkImageWidget(urls: imagePath)
                // FadeInImage.assetNetwork(

                //     placeholder: Assets.images.placeholderImage
                //         .path, // Path to your local placeholder image
                //     image: imagePath, // Network image URL
                //     fit: BoxFit.cover,
                //     imageErrorBuilder: (context, error, stackTrace) {
                //       return Image.asset(Assets.images.placeholderImage.path,
                //           fit: BoxFit.cover);
                //     },
                //   ),
                ),
          ),
          // UIHelper.horizontalSpace(8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextFontStyle
                      .headline16c666666tyleMontserratW600
                      .copyWith(
                          color: AppColors.c57AE8F, height: 1.5.h),
                ),
                UIHelper.verticalSpace(8.w),
                Text(
                  description,
                  style: TextFontStyle
                      .headline16c333333tyleMontserratW400
                      .copyWith(
                          color: AppColors.c57AE8F, fontSize: 14.sp),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
