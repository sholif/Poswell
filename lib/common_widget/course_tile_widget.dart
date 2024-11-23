
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

class CourseTileWidget extends StatelessWidget {
  final String title, imagePath;
  final Function() onTap;
  const CourseTileWidget(
      {super.key,
      required this.title,
      required this.imagePath,
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
              width: 140.w,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    bottomLeft: Radius.circular(10.r),
                  ),
                  child: FadeInImage.assetNetwork(
                    height: 100,
                    width: 140,
                    placeholder: Assets.images.placeholderImage
                        .path, // Path to your local placeholder image
                    image: imagePath, // Network image URL
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(Assets.images.placeholderImage.path,
                          fit: BoxFit.cover);
                    },
                  ),
                  ),
            ),
            Text(
              title,
              style: TextFontStyle.headline16c666666tyleMontserratW600
                  .copyWith(fontSize: 18.sp, color: AppColors.allPrimaryColor),
            )
          ],
        ),
      ),
    );
  }
}
