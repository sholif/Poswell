
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Widget? suffixWidget;
  const CustomButtonWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.suffixWidget
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 52.h,
        decoration: ShapeDecoration(
          gradient: const RadialGradient(
            center: Alignment(0.00, -1.7),
            radius: 2,
            colors: [Color(0xFFEBE6E0), Color(0xFFCBC1B4)],
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r)),
        ),
        // alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextFontStyle.text16c2F1E19StyleRobotoW600.copyWith(
                color: AppColors.c2F1E19
              ),
            ),
            suffixWidget !=null? UIHelper.horizontalSpaceSmall : const SizedBox.shrink(),
            suffixWidget?? const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
