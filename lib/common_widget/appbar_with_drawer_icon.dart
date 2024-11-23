import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/text_font_style.dart';
import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';
import '../helpers/ui_helpers.dart';

class AppbarWithDrawerIcon extends StatelessWidget
    implements PreferredSizeWidget {
  final bool showBackButton;
  final String title;
  final Function() onTapDrawer;
  final double? horizontalPadding;
  const AppbarWithDrawerIcon(
      {super.key,
      required this.title,
      required this.onTapDrawer,
      this.horizontalPadding,
      this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UIHelper.verticalSpace(40.h),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: horizontalPadding?? UIHelper.kDefaulutPadding()),
          child: Row(
            mainAxisAlignment: showBackButton
                ? MainAxisAlignment.start
                : MainAxisAlignment.start,
            children: [
              showBackButton
                  ? IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded))
                  : const SizedBox.shrink(),
              showBackButton? UIHelper.horizontalSpace(10.w) : const SizedBox.shrink(),
              Text(
                title,
                style: TextFontStyle.headline28cFFFFFFStyleOpenSenseW700
                    .copyWith(color: AppColors.c2F1E19),
              ),
              const Spacer(),
              GestureDetector(
                  onTap: onTapDrawer,
                  child: SvgPicture.asset(Assets.icons.menuIcon))
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}
