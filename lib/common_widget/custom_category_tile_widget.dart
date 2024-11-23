
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/colors.gen.dart';

class CustomCategoryTileWidget extends StatelessWidget {
  final String title;
  const CustomCategoryTileWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // height: 56.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.cFFFFFF.withOpacity(0.6),
              borderRadius: BorderRadius.circular(8.r)),
          margin: EdgeInsets.symmetric( vertical: 8.h ),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.w),
          child: Row(
            children: [
              Expanded(
                child: Text(title,
                    style: TextFontStyle.headline16c292929StyleOpenSenseW600
                        .copyWith(color: AppColors.c161C24)),
              ),
              // const Spacer(),
              SizedBox(
                  width: 26.w,
                  child: const Icon(Icons.keyboard_arrow_right_rounded))
            ],
          ),
        ),
      ],
    );
  }
}
