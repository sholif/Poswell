import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/common_widget/custom_app_bar.dart';
import 'package:poswell_app/common_widget/custom_button_widget.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/toast.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';
import 'package:poswell_app/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class SignUpOtpScreen extends StatefulWidget {
  const SignUpOtpScreen({super.key});

  @override
  State<SignUpOtpScreen> createState() => _SignUpOtpScreenState();
}

class _SignUpOtpScreenState extends State<SignUpOtpScreen> {
  String otpCode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.gradiantTopBottom,
              AppColors.gradiantMiddle,
              AppColors.gradiantTopBottom,
            ],
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding:
              EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
          children: [
            UIHelper.verticalSpace(25.h),
            CustomAppbar(
              name: "OTP Verification",
              showBack: true,
              titleSpace: 65.w,
            ),
            UIHelper.verticalSpace(40.h),
            OtpTextField(
              numberOfFields: 6,
              focusedBorderColor: AppColors.cC3B9AA,
              showFieldAsBox: true,
              textStyle: TextFontStyle.headline16c292929StyleOpenSenseW600,
              borderRadius: BorderRadius.circular(8.r),
              fieldWidth: 50.w,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                otpCode = verificationCode;
              }, // end onSubmit
            ),
            UIHelper.verticalSpace(60.h),
            CustomButtonWidget(
                title: "Verify",
                onTap: () {
                  if(otpCode ==""){
                    ToastUtil.showShortToast("Please input your OTP code first");
                  }else{
                    context.read<AuthProvider>().setOtp(otp: otpCode);
                    // registrationOtpVerifyRXObj.verifyOtp(
                    //   email: context.read<AuthProvider>().registerEmail, 
                    //   otp: otpCode
                    //   ).waitingForSucess().then((sucess){
                    //     if(sucess){
                    //       NavigationService.navigateTo(Routes.navigationScreen);
                    //     }
                    //   });
                  }
                }),
          ],
        ),
      ),
    );
  }
}
