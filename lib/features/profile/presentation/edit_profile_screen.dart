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

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
                UIHelper.horizontalSpace(120.w),
                Text(
                  "Edit Profile",
                  style: TextFontStyle.headline16c666666tyleMontserratW600
                      .copyWith(fontSize: 18.sp, color: AppColors.c1E1E1E),
                ),
              ],
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 110,
                width: 110,
                decoration: const BoxDecoration(
                  color: AppColors.cFFFFFF,
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(110.r),
                    child: Image.asset(Assets.images.userImg.path)),
              ),
              Positioned(
                  right: -2.h,
                  bottom: 2.h,
                  child: Container(
                    height: 36.h,
                    width: 36.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23.r),
                        color: AppColors.allPrimaryColor,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.c000000.withOpacity(0.15),
                              offset: const Offset(00, 01),
                              blurRadius: 4.sp)
                        ]),
                    alignment: Alignment.center,
                    child: SvgPicture.asset(Assets.icons.cameraIcon),
                  ))
            ],
          ),
          UIHelper.verticalSpace(44.h),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
            child: CustomFormField(
              inputType: TextInputType.name,
              title: "First Name",
              hintText: "First Name",
            ),
          ),
          UIHelper.verticalSpace(24.h),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
            child: CustomFormField(
              inputType: TextInputType.name,
              title: "Last Name",
              hintText: "Last Name",
            ),
          ),
          UIHelper.verticalSpace(24.h),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
            child: CustomFormField(
              inputType: TextInputType.name,
              title: "Address",
              hintText: "address here",
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
