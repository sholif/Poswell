import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';

class NotificationToggleScreen extends StatefulWidget {
  const NotificationToggleScreen({super.key});

  @override
  State<NotificationToggleScreen> createState() =>
      _NotificationToggleScreenState();
}

class _NotificationToggleScreenState extends State<NotificationToggleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          UIHelper.verticalSpace(30.h),
          GestureDetector(
            onTap: () {},
            child: const NotificationTileWidget(
              title: "Push Notifications",
            ),
          ),
          const NotificationTileWidget(
            title: "Chat",
          ),
          const NotificationTileWidget(
            title: "Payment",
          ),
        ],
      ),
    );
  }
}

class NotificationTileWidget extends StatelessWidget {
  final String title;
  const NotificationTileWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: UIHelper.kDefaulutPadding(), vertical: 22.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextFontStyle.headline16c333333tyleMontserratW500
                .copyWith(color: AppColors.c344057, fontSize: 14.sp),
          ),
          FlutterSwitch(
              height: 20.h,
              width: 38.w,
              padding: 3.sp,
              toggleSize: 15.sp,
              activeColor: AppColors.c036D54,
              activeToggleColor: AppColors.cFFFFFF,
              value: true,
              onToggle: (value) {})
        ],
      ),
    );
  }
}
