import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/helpers/toast.dart';
import 'package:poswell_app/networks/api_acess.dart';
import '../../../../common_widget/auth_button.dart';
import '../../../../common_widget/custom_button.dart';
import '../../../../common_widget/custom_text_input.dart';
import '../../../../common_widget/middle_or_widget.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/ui_helpers.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final cPassword = TextEditingController();

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
            'Sign up',
            style: TextFontStyle.headline16c666666tyleMontserratW600
                .copyWith(color: AppColors.c2C2C2E),
          ),
          UIHelper.verticalSpace(12.h),
          Row(
            children: [
              Text(
                "Welcome to ",
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
            textEditingController: firstName,
            inputType: TextInputType.name,
            title: "First Name*",
            hintText: "Name",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your first name";
              }
              return null;
            },
          ),
          UIHelper.verticalSpace(16.h),
          CustomFormField(
            textEditingController: lastName,
            inputType: TextInputType.name,
            title: "Last Name*",
            hintText: "Name",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your last name";
              }
              return null;
            },
          ),
          UIHelper.verticalSpace(16.h),
          CustomFormField(
            textEditingController: email,
            inputType: TextInputType.emailAddress,
            title: "Email Address*",
            hintText: "abc@gmail.com",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your e-mail";
              }
              return null;
            },
          ),
          UIHelper.verticalSpace(16.h),
          CustomFormField(
            textEditingController: password,
            inputType: TextInputType.name,
            title: "Password*",
            hintText: "confirm password",
            textInputAction: TextInputAction.done,
            suffixIcon: SvgPicture.asset(Assets.icons.eyeOff),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters long';
              }
              return null;
            },
          ),
          UIHelper.verticalSpace(16.h),
          CustomFormField(
            textEditingController: cPassword,
            inputType: TextInputType.name,
            title: "confirm password*",
            hintText: "confirm password",
            textInputAction: TextInputAction.done,
            suffixIcon: SvgPicture.asset(Assets.icons.eyeOff),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your confirm password';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters long';
              }
              if (value != password.text.trim()) {
                return "Both password's are not matched";
              }
              return null;
            },
          ),
          UIHelper.verticalSpace(65.h),
          ValueListenableBuilder(valueListenable: isLoading, builder: (context, value, child) {
            return  AuthCustomeButton(
            onCallBack: () {
              _signUpMethod();
            },
            name:!isLoading.value?"Sign up":"Loading..",
            height: 45.h,
            minWidth: double.maxFinite,
            borderRadius: 5.r,
            color: AppColors.allPrimaryColor,
            textStyle: TextFontStyle.headline16c666666tyleMontserratW600
                .copyWith(color: AppColors.cFFFFFF),
            context: context,
          );
          },),
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

  void _signUpMethod() async {
    if (formKey.currentState?.validate() ?? false) {
      // Loading Start's
      isLoading.value = true;
      // NavigationService.navigateTo(Routes.setUserName);

      await getSignupResponseRXObj
          .signup(
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        email: email.text.trim(),
        password: password.text.trim(),
        confirmPw: cPassword.text.trim(),
      )
          .then((succcess) {
        if (succcess) {
          NavigationService.navigateToWithArgs(
              Routes.subscriptionScreen, {'data': false});
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
