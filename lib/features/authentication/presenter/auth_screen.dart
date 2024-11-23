import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/common_widget/logo_widget.dart';
import 'package:poswell_app/features/authentication/presenter/sign_in/sigin_screen.dart';
import 'package:poswell_app/features/authentication/presenter/sign_up/signup_screen.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';
import '../../../constants/text_font_style.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.cFFFFFF,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UIHelper.verticalSpace(50.h),
            const LogoWidget(),
            UIHelper.verticalSpaceMedium,
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
              child: Container(
                height: 46.h,
                decoration: BoxDecoration(
                  color: AppColors.cF4F4F4,
                  borderRadius: BorderRadius.circular(
                    8.r,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 4.h),
                child: TabBar(
                  unselectedLabelStyle: TextFontStyle
                      .headline16c666666tyleMontserratW600
                      .copyWith(fontSize: 14.sp, color: AppColors.cA0A0A0),
                  labelStyle: TextFontStyle.headline16c666666tyleMontserratW600
                      .copyWith(
                    fontSize: 14.sp,
                    color: AppColors.c57AE8F,
                  ),
                  indicator: BoxDecoration(
                    color: AppColors.cFFFFFF,
                    borderRadius: BorderRadius.circular(
                      8.r,
                    ),
                  ),
                  tabs: const [
                    Tab(
                      text: "Sign in",
                    ),
                    Tab(
                      text: "Sign up",
                    )
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  SignInScreen(),
                  SignUpScreen(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

