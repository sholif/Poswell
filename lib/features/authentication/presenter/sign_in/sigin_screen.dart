import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/common_widget/custom_button.dart';
import 'package:poswell_app/common_widget/middle_or_widget.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/helpers/all_routes.dart';
import 'package:poswell_app/helpers/navigation_service.dart';
import 'package:poswell_app/helpers/toast.dart';
import 'package:poswell_app/networks/api_acess.dart';
import '../../../../common_widget/auth_button.dart';
import '../../../../common_widget/custom_text_input.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    super.key,
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
        children: [
          UIHelper.verticalSpace(16.h),
          Text(
            'Sign in',
            style: TextFontStyle.headline16c666666tyleMontserratW600
                .copyWith(color: AppColors.c2C2C2E),
          ),
          UIHelper.verticalSpace(12.h),
          Row(
            children: [
              Text(
                "Welcome back to ",
                style: TextFontStyle.headline16c333333tyleMontserratW500
                    .copyWith(color: AppColors.c979797),
              ),
              Text(
                "Pos-Well",
                style: TextFontStyle.headline16c666666tyleMontserratW700
                    .copyWith(color: AppColors.c979797),
              ),
            ],
          ),
          UIHelper.verticalSpace(16.h),
          CustomFormField(
            inputType: TextInputType.emailAddress,
            title: "Email Address",
            hintText: "abc@gmail.com",
            textEditingController: email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your valid email";
              }
              return null;
            },
          ),
          UIHelper.verticalSpace(16.h),
          CustomFormField(
            textEditingController: password,
            inputType: TextInputType.name,
            title: "Password",
            hintText: "confirm password",
            textInputAction: TextInputAction.done,
            suffixIcon: SvgPicture.asset(Assets.icons.eyeOff),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your password";
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters long';
              }
              return null;
            },
          ),
          UIHelper.verticalSpace(30.h),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () =>
                  NavigationService.navigateTo(Routes.forgotPasswordScreen),
              child: Text(
                "Forgot Password",
                style: TextFontStyle.headline16c333333tyleMontserratW500
                    .copyWith(color: AppColors.c57AE8F, fontSize: 14.sp),
              ),
            ),
          ),
          UIHelper.verticalSpace(30.h),
          ValueListenableBuilder(
            valueListenable: isLoading,
            builder: (context, value, child) {
              return AuthCustomeButton(
                  onCallBack: () {
                    _loginMethod();
                  },
                  name: !isLoading.value ? "Sign in" : "Loading..",
                  height: 45.h,
                  minWidth: double.maxFinite,
                  borderRadius: 5.r,
                  color: AppColors.allPrimaryColor,
                  textStyle: TextFontStyle.headline16c666666tyleMontserratW600
                      .copyWith(color: AppColors.cFFFFFF),
                  context: context);
            },
          ),
          UIHelper.verticalSpace(24.h),
          const MiddleOrWidget(),
          UIHelper.verticalSpace(24.h),
          customeButton(
              icon: SvgPicture.asset(Assets.icons.google),
              name: "Continue with Google",
              onCallBack: () {},
              height: 56.h,
              minWidth: double.infinity,
              borderRadius: 5.r,
              borderColor: AppColors.cE2E2E2,
              color: AppColors.cFFFFFF,
              textStyle: TextFontStyle.headline16c666666tyleMontserratW600
                  .copyWith(color: AppColors.c2C2C2E),
              context: context),
          UIHelper.verticalSpace(20.h),
          customeButton(
              icon: SvgPicture.asset(Assets.icons.facebook),
              name: "Continue with Facebook",
              onCallBack: () {},
              height: 56.h,
              minWidth: double.infinity,
              borderRadius: 5.r,
              borderColor: AppColors.cE2E2E2,
              color: AppColors.cFFFFFF,
              textStyle: TextFontStyle.headline16c666666tyleMontserratW600
                  .copyWith(color: AppColors.c2C2C2E),
              context: context),
          UIHelper.verticalSpace(40.h),
        ],
      ),
    );
  }

  void _loginMethod() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;

      await getLoginResponseRXObj
          .logIn(email: email.text.trim(), password: password.text.trim())
          .then((success) {
        if (success) {
          isLoading.value = false;

          NavigationService.navigateTo(Routes.navigationScreen);
        }
        isLoading.value = false;
      }, onError: (error) {
        isLoading.value = false;
        ToastUtil.showShortToast(error);
        return null;
      });
    } else {
      isLoading.value = false;
    }
  }
}
