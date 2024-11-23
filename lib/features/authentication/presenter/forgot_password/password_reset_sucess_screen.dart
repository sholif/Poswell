import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/navigation_service.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

import '../../../../common_widget/auth_button.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../helpers/all_routes.dart';

class PasswordResetSucessScreen extends StatefulWidget {
  const PasswordResetSucessScreen({super.key});

  @override
  State<PasswordResetSucessScreen> createState() => _PasswordResetSucessScreenState();
}

class _PasswordResetSucessScreenState extends State<PasswordResetSucessScreen> with SingleTickerProviderStateMixin {

    late AnimationController _controller;
 late Animation<double> _sizeAnimation;
 late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _sizeAnimation = Tween<double>(begin: 0, end: 200).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // _controller.reverse();
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: AppColors.allPrimaryColor,
        padding: EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
        child: Column(
          children: [
            UIHelper.verticalSpace(200.h),

            SizedBox(
              //  width: double.maxFinite,
              child: AnimatedBuilder(
                        animation: _sizeAnimation,
                        builder: (context, child) {
              return SizedBox(
                width: _sizeAnimation.value,
                height: _sizeAnimation.value,
                child: Opacity(
                  opacity: _opacityAnimation.value,
                  child: SvgPicture.asset(Assets.images.succesState)),
              );
                        },
                      ),
            ),
            // SvgPicture.asset(Assets.images.succesState),
            UIHelper.verticalSpace(60.h),
            Text(
              "Password Recovered",
              style: TextFontStyle.headline16c666666tyleMontserratW600
                  .copyWith(color: AppColors.cFFFFFF, fontSize: 18.sp),
            ),
            UIHelper.verticalSpace(15.h),
            Text(
              "The password has been successfully recovered, you can log in back with a new password",
              textAlign: TextAlign.center,
              style: TextFontStyle.headline16c333333tyleMontserratW500
                  .copyWith(color: AppColors.cFFFFFF, fontSize: 14.sp),
            ),
            const Spacer(),
            AuthCustomeButton(
                onCallBack: () {
                  NavigationService.popAndReplace(Routes.authScreen);
                },
                name: "Back to Sign in",
                height: 45.h,
                minWidth: double.maxFinite,
                borderRadius: 5.r,
                color: AppColors.cFFFFFF,
                textStyle: TextFontStyle.headline16c666666tyleMontserratW600
                    .copyWith(color: AppColors.allPrimaryColor),
                context: context),
            UIHelper.verticalSpace(70.h),

          ],
        ),
      ),
    );
  }
}
