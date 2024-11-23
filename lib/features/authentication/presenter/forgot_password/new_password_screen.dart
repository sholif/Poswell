import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/common_widget/custom_app_bar.dart';
import 'package:poswell_app/common_widget/custom_text_input.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

import '../../../../common_widget/auth_button.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
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
                    "Create New Password",
                    style: TextFontStyle.headline16c666666tyleMontserratW600
                        .copyWith(color: AppColors.c1E1E1E, fontSize: 18.sp),
                  ),
                  UIHelper.verticalSpace(20.h),
                  Text(
                    "Create a new password that is safer and easier to remember.",
                    style: TextFontStyle.headline16c333333tyleMontserratW500
                        .copyWith(color: AppColors.c979797, fontSize: 14.sp),
                  ),
                  UIHelper.verticalSpace(40.h),
                  CustomFormField(
                      inputType: TextInputType.name,
                      title: "Password",
                      hintText: "min. 8 characters",
                      suffixIcon: SvgPicture.asset(Assets.icons.eyeOff)),
                  UIHelper.verticalSpace(16.h),
                  CustomFormField(
                      inputType: TextInputType.name,
                      title: "Confirm Password",
                      hintText: "confirm password",
                      textInputAction: TextInputAction.done,
                      suffixIcon: SvgPicture.asset(Assets.icons.eyeOff)),
                ],
              ),
              Positioned(
                  bottom: MediaQuery.of(context).viewInsets.bottom +
                      UIHelper.kDefaulutPadding(),
                  right: UIHelper.kDefaulutPadding(),
                  left: UIHelper.kDefaulutPadding(),
                  child: AuthCustomeButton(
                      onCallBack: () {
                        NavigationService.navigateTo(Routes.passwordSucessScreen);
                      },
                      name: "Recover Password",
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
