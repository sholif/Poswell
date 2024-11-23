import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/common_widget/custom_app_bar.dart';
import 'package:poswell_app/common_widget/custom_text_input.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

import '../../../../common_widget/auth_button.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

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
                    "Forgot Password",
                    style: TextFontStyle.headline16c666666tyleMontserratW600
                        .copyWith(color: AppColors.c1E1E1E, fontSize: 18.sp),
                  ),
                  UIHelper.verticalSpace(20.h),
                  Text(
                    "Enter the email address for which you forgot the password. We will send an OTP to the email.",
                    style: TextFontStyle.headline16c333333tyleMontserratW500
                        .copyWith(color: AppColors.c979797, fontSize: 14.sp),
                  ),
                  UIHelper.verticalSpace(20.h),
                  CustomFormField(
                    title: "Email Address",
                    hintText: "abc@gmail.com",
                    inputType: TextInputType.emailAddress,
                    textEditingController: _emailController,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter your email";
                      } else {
                        return null;
                      }
                    },
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
                          NavigationService.navigateTo(Routes.otpScreen);
                      },
                      name: "Send OTP",
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
