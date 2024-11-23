import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poswell_app/common_widget/custom_text_input.dart';
import 'package:poswell_app/gen/colors.gen.dart';

import '../../../common_widget/auth_button.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';

class AddJournalScreen extends StatelessWidget {
  const AddJournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
        children: [
          UIHelper.verticalSpace(60.h),
          Row(
            children: [
              InkWell(
                  onTap: () => NavigationService.goBack,
                  child: SvgPicture.asset(
                    Assets.icons.backArrow,
                  )),
              UIHelper.horizontalSpace(135.w),
              Text(
                "Journal",
                style: TextFontStyle.headline16c666666tyleMontserratW600
                    .copyWith(fontSize: 18.sp),
              )
            ],
          ),
          UIHelper.verticalSpace(25.h),
          Container(
            height: 156.h ,width:  double.maxFinite,
            decoration: BoxDecoration(
              color: AppColors.cF1FFFA,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: AppColors.cE7E7E7
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.icons.uploadImage),
                UIHelper.verticalSpace(10.h),
                Text(
                  "Add cover image",
                  style: TextFontStyle.headline16c333333tyleMontserratW500.copyWith(
                    color: AppColors.c141414, fontSize: 12.sp
                  ),
                )
              ],
            ),
          ),
          UIHelper.verticalSpace(25.h),
          CustomFormField(
            inputType: TextInputType.name, 
            title: "Title",hintText: "Title",
            ),
          UIHelper.verticalSpace(25.h),
          CustomFormField(
            inputType: TextInputType.name, 
            title: "Description",hintText: "Write your article here.....",
            maxline: 18,
            )
          

        ],
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: UIHelper.kDefaulutPadding(),
          vertical: 10.h
        ),
        child: AuthCustomeButton(
              onCallBack: () {
                NavigationService.goBack;
              },
              name: "Submit",
              height: 45.h,
              minWidth: double.maxFinite,
              borderRadius: 5.r,
              color: AppColors.allPrimaryColor,
              textStyle: TextFontStyle
                  .headline16c666666tyleMontserratW600
                  .copyWith(color: AppColors.cFFFFFF),
              context: context),
      ),
    );
  }
}
