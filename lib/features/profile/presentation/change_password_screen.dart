import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/common_widget/custom_text_input.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import '../../../common_widget/auth_button.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
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
                UIHelper.horizontalSpace(90.w),
                Text(
                  "Change Password",
                  style: TextFontStyle.headline16c666666tyleMontserratW600
                      .copyWith(fontSize: 18.sp, color: AppColors.c1E1E1E),
                ),
              ],
            ),
          ),
          
          UIHelper.verticalSpace(44.h),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
            child: CustomFormField(
              inputType: TextInputType.name,
              title: "Current Password",
              hintText: "confirm password",
              suffixIcon: SvgPicture.asset(Assets.icons.eyeOff)
            ),
          ),
          UIHelper.verticalSpace(24.h),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
            child: CustomFormField(
              inputType: TextInputType.name,
              title: "New Password",
              hintText: "confirm password",
              suffixIcon: SvgPicture.asset(Assets.icons.eyeOff)
            ),
          ),
          UIHelper.verticalSpace(24.h),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
            child: CustomFormField(
              inputType: TextInputType.name,
              title: "Confirm Password",
              hintText: "confirm password",
              suffixIcon: SvgPicture.asset(Assets.icons.eyeOff)
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: UIHelper.kDefaulutPadding(), vertical: 10.h),
        child: AuthCustomeButton(
            onCallBack: () {
              NavigationService.goBack;
            },
            name: "Save Changes",
            height: 45.h,
            minWidth: double.maxFinite,
            borderRadius: 5.r,
            color: AppColors.allPrimaryColor,
            textStyle: TextFontStyle.headline16c666666tyleMontserratW600
                .copyWith(color: AppColors.cFFFFFF),
            context: context),
      ),
    );
  }
}
