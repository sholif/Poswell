import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/common_widget/custom_app_bar.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/all_routes.dart';
import 'package:poswell_app/helpers/navigation_service.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';
import '../../../../common_widget/auth_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Form(
          key: formKey,
          child: Stack(
            children: [
              ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: UIHelper.kDefaulutPadding()),
                children: [
                  UIHelper.verticalSpace(25.h),
                  const CustomAppbar(
                    name: "",
                    showBack: true,
                  ),
                  UIHelper.verticalSpace(20.h),
                  Text(
                    "Verification code",
                    style: TextFontStyle.headline16c666666tyleMontserratW600
                        .copyWith(color: AppColors.c1E1E1E, fontSize: 18.sp),
                  ),
                  UIHelper.verticalSpace(20.h),
                  Text(
                    "Enter verification code sent to your entered phone number.",
                    style: TextFontStyle.headline16c333333tyleMontserratW500
                        .copyWith(color: AppColors.c979797, fontSize: 14.sp),
                  ),
                  UIHelper.verticalSpace(20.h),
                  OtpTextField(
                    numberOfFields: 4,
                    focusedBorderColor: AppColors.c1E1E1E,
                    borderColor: AppColors.cE2E2E2,
                    showFieldAsBox: true,
                    contentPadding: EdgeInsets.all(2.sp),
                    textStyle: TextFontStyle.headline16c333333tyleMontserratW500
                        .copyWith(fontSize: 18.sp, color: AppColors.c1E1E1E),
                    borderRadius: BorderRadius.circular(5.r),
                    fieldWidth: 61.w,
                    fieldHeight: 48.h,
                    onCodeChanged: (String code) {},
                    onSubmit: (String verificationCode) {}, // end onSubmit
                  ),
                  UIHelper.verticalSpace(40.h),
                  Row(
                    mainAxisAlignment: 
                    MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t receive code ? ",
                        style: TextFontStyle.headline16c333333tyleMontserratW500
                            .copyWith(color: AppColors.c1E1E1E, fontSize: 14.sp),
                      ),
                      Text(
                        "Re-send",
                        style: TextFontStyle.headline16c666666tyleMontserratW600
                            .copyWith(
                              color: AppColors.c57AE8F, 
                              fontSize: 14.sp,
                              decoration: TextDecoration.underline
                              ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                  bottom: MediaQuery.of(context).viewInsets.bottom +
                      UIHelper.kDefaulutPadding(),
                  right: UIHelper.kDefaulutPadding(),
                  left: UIHelper.kDefaulutPadding(),
                  child: AuthCustomeButton(
                      onCallBack: () {
                          NavigationService.navigateTo(Routes.newPasswordScreen);
                      },
                      name: "Verify",
                      height: 45.h,
                      minWidth: double.maxFinite,
                      borderRadius: 5.r,
                      color: AppColors.allPrimaryColor,
                      textStyle: TextFontStyle
                          .headline16c666666tyleMontserratW600
                          .copyWith(color: AppColors.cFFFFFF),
                      context: context))
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
