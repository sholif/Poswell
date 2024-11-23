import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';
import '../../../../gen/colors.gen.dart';

Widget customeButton({
  required String name,
  required VoidCallback onCallBack,
  required double height,
  required double minWidth,
  required double borderRadius,
  required Color color,
  required TextStyle textStyle,
  required BuildContext context,
  Color? borderColor,
  Widget? icon,
}) {
  return MaterialButton(
    onPressed: onCallBack,
    height: height,
    minWidth: minWidth,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: borderColor ?? AppColors.allPrimaryColor, width: 0.9.sp),
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    color: color,
    splashColor: Colors.white.withOpacity(0.4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon?? const SizedBox(), 
        icon !=null? UIHelper.horizontalSpace(16.w): UIHelper.horizontalSpace(0),
        Text(
          name,
          style: textStyle,
        ),
      ],
    ),
  );
}
