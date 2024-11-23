import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/features/subscription/widgets/premimum_tile_widget.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';
import '../widgets/free_traila_widget.dart';

class SubscriptionScreen extends StatefulWidget {
  final bool isFromCourses;
  const SubscriptionScreen({super.key, required this.isFromCourses});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  bool showPremium = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      showPremium = widget.isFromCourses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UIHelper.verticalSpace(40.h),
          Text(
            "Subscription",
            style: TextFontStyle.headline16c666666tyleMontserratW600
                .copyWith(color: AppColors.c2C2C2E, fontSize: 18.sp),
          ),
          UIHelper.verticalSpace(22.h),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
            child: Row(
              children: [
                subButton(
                    isActive: !showPremium,
                    onTap: () {
                      setState(() {
                        showPremium = !showPremium;
                      });
                    },
                    title: "Free"),
                UIHelper.horizontalSpace(10.w),
                subButton(
                    isActive: showPremium,
                    onTap: () {
                      setState(() {
                        showPremium = !showPremium;
                      });
                    },
                    title: "Premium"),
              ],
            ),
          ),
          UIHelper.verticalSpace(24.h),
          showPremium ? const PremimumTileWidget() : const FreeTrailWidget()
        ],
      ),
    );
  }

  InkWell subButton({
    required String title,
    required bool isActive,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 27.h,
        decoration: BoxDecoration(
          color: isActive ? AppColors.c57AE8F : AppColors.cFFFFFF,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
                color: AppColors.c000000.withOpacity(0.15), blurRadius: 10.sp)
          ],
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Text(
          title,
          style: TextFontStyle.headline16c666666tyleMontserratW600.copyWith(
              color: isActive ? AppColors.cF1F0F0 : AppColors.c666666),
        ),
      ),
    );
  }
}
