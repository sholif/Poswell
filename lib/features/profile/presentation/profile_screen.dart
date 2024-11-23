// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poswell_app/helpers/all_routes.dart';
import 'package:poswell_app/helpers/helper_methods.dart';
import 'package:share_plus/share_plus.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                Assets.images.splashBg.path,
              ),
              colorFilter: ColorFilter.mode(
                AppColors.c000000.withOpacity(0.6),
                BlendMode.darken,
              ),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          UIHelper.verticalSpace(50.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding() ),
            child: Row(
              children: [
                InkWell(
                    onTap: () => NavigationService.goBack,
                    child: SvgPicture.asset(
                      Assets.icons.backArrow,
                      color: AppColors.cFFFFFF,
                    )),
                UIHelper.horizontalSpace(135.w),
                Text(
                  "Profile",
                  style: TextFontStyle.headline16c666666tyleMontserratW600
                      .copyWith(color: AppColors.cFFFFFF, fontSize: 18.sp),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                UIHelper.verticalSpace(80.h),
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.cFFFFFF,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.r),
                              topRight: Radius.circular(20.r),
                            )),
                            child: ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                UIHelper.verticalSpace(60.h),
                                ProfileTileWidget(
                                  title: "Edit Profile",
                                  onTap: (){
                                    NavigationService.navigateTo(Routes.editProfileScreen);
                                  },
                                ),
                                UIHelper.verticalSpace(16.h),
                                 ProfileTileWidget(
                                  title: "Change Password",
                                  onTap: (){
                                    NavigationService.navigateTo(Routes.changePasswordScreen);

                                  },
                                ),
                                UIHelper.verticalSpace(16.h),
                                 ProfileTileWidget(
                                  title: "Notifications",
                                  onTap: (){
                                    NavigationService.navigateTo(Routes.notificationToggleScreen);

                                  },
                                ),
                                UIHelper.verticalSpace(16.h),
                                 ProfileTileWidget(
                                  title: "Subscription",
                                  onTap: (){},
                                ),
                                UIHelper.verticalSpace(16.h),
                                 ProfileTileWidget(
                                  title: "Daily Affirmation",
                                  onTap: (){
                                    NavigationService.navigateTo(Routes.notificationTimerScreen);
                                  },
                                ),
                                UIHelper.verticalSpace(16.h),
                                 ProfileTileWidget(
                                  title: "Invite Friends",
                                  onTap: (){
                                    Share.share('check out my App https://google.com', subject: 'Look what I made!');
                                  },
                                  showTrailingIcon: false,
                                ),
                                UIHelper.verticalSpace(66.h),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
                                  child: InkWell(
                                    onTap: (){
                                      showLogoutDialog(context);
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "Logout",
                                          style: TextFontStyle.headline16c333333tyleMontserratW500.copyWith(
                                            fontSize: 16.sp, color: AppColors.c1E1E1E
                                          ),
                                        ),
                                        UIHelper.horizontalSpace(12.w),
                                        SvgPicture.asset(Assets.icons.logoutIcon)
                                      ],
                                    ),
                                  ),
                                ),
                                UIHelper.verticalSpace(16.h),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
                                  child: InkWell(
                                    onTap: (){
                                      showAccountDeleteDialog(context);

                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "Delete account",
                                          style: TextFontStyle.headline16c333333tyleMontserratW500.copyWith(
                                            fontSize: 16.sp, color: AppColors.c1E1E1E
                                          ),
                                        ),
                                        UIHelper.horizontalSpace(12.w),
                                        SvgPicture.asset(Assets.icons.deleteIcon)
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                      ),
                      const Positioned(
                          top: -50,
                          right: 0,
                          left: 0,
                          child: ProfileAvatarWidget())
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    )
        );
  }
}

class ProfileTileWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool showTrailingIcon;
  const ProfileTileWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.showTrailingIcon = true
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
         width: double.maxFinite,
        margin: EdgeInsets.symmetric(
          horizontal: UIHelper.kDefaulutPadding()
        ),
        decoration: BoxDecoration(
          color: AppColors.cFFFFFF, 
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.c000000.withOpacity(0.15),
              blurRadius: 8.sp,
              offset: const Offset(00, 01)
            )
          ]
        ),
        padding: EdgeInsets.all(15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextFontStyle.headline16c333333tyleMontserratW500.copyWith(
                color: AppColors.c1E1E1E, fontSize: 16.sp
              ),
              ),
              if(showTrailingIcon) SvgPicture.asset(Assets.icons.arrowRight)
          ],
        ),
      ),
    );
  }
}

class ProfileAvatarWidget extends StatelessWidget {
  const ProfileAvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                  color: AppColors.cFFFFFF,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.c000000
                            .withOpacity(0.15),
                        offset: const Offset(00, 01),
                        blurRadius: 4.sp)
                  ]),
    
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(110.r),
                    child: Image.asset(Assets.images.userImg.path)),
            ),
            Positioned(
                right: -2.h,
                bottom: 11.h,
                child: Container(
                  height: 14.h,
                  width: 26.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23.r),
                      color: AppColors.cFFFFFF,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.c000000
                                .withOpacity(0.15),
                            offset: const Offset(00, 01),
                            blurRadius: 4.sp)
                      ]),
                      alignment: Alignment.center,
                      child: Text(
                        "Pro",
                        style: TextFontStyle.headline16c333333tyleMontserratW500.copyWith(
                          fontSize: 10.sp, color: AppColors.c57AE8F
                        ),
                      ),
                ))
          ],
        ),
      ],
    );
  }
}
