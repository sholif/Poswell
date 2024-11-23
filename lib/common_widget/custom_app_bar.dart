
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';
import '../constants/text_font_style.dart';
import '../helpers/navigation_service.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final bool showBack;
  final double titleSpace;
  final Widget? trailingWidget;
  const CustomAppbar({
    super.key,
    required this.name,
    this.showBack = false,
    this.titleSpace = 0,
    this.trailingWidget
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      color:Colors.transparent,
      child: Padding(
        padding:  EdgeInsets.only(top: 20.h, left:  UIHelper.kDefaulutPadding(),right: UIHelper.kDefaulutPadding(),  ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center, 
          mainAxisAlignment:  MainAxisAlignment.spaceBetween,
        children: [
          if(showBack) InkWell(
            onTap: () => NavigationService.goBack,
            child: SvgPicture.asset(Assets.icons.backArrow)
          ),
          //  if(showBack) UIHelper.horizontalSpace(titleSpace),
          Text(
            name.tr, // title,
            overflow: TextOverflow.ellipsis,
            style: TextFontStyle.headline16c666666tyleMontserratW600.copyWith(
              color: AppColors.c1E1E1E, fontSize: 18.sp
            )
                .copyWith(fontSize: 20.sp),
          ),
          // trailingWidget !=null?   Flexible(child: Container(),) : const SizedBox.shrink() ,
          trailingWidget?? const SizedBox.shrink()
        ]),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(75.h);
}
