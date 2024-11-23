
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/features/profile/model/profile_response_model.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/all_routes.dart';
import 'package:poswell_app/helpers/navigation_service.dart';
import 'package:poswell_app/networks/api_acess.dart';

import '../../../gen/assets.gen.dart';
import '../../../helpers/ui_helpers.dart';

class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h, width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        image: DecorationImage(image: AssetImage(Assets.images.homeBannerBg.path), fit: BoxFit.cover ),
        boxShadow: [
          BoxShadow(
            color: AppColors.c000000.withOpacity(0.15),
            blurRadius: 7.h
          )
        ]
      ),
      padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => NavigationService.navigateTo(Routes.profileScreen),
              child: SvgPicture.asset(Assets.icons.menuIcon)),
            InkWell(
              onTap: () => NavigationService.navigateTo(Routes.notificationScreen),
              child: SvgPicture.asset(Assets.icons.notificationIcon)),
          ],
        ),
        UIHelper.verticalSpace(56.h),
        StreamBuilder(
          stream: getProfileRXOBJ.profileStream,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting || snapshot.data == null){
              return const SizedBox();
            }else{
              ProfileResponseModel data = snapshot.data;
              return Text(
              "Hello ${data.data!.firstName}!",
              style: TextFontStyle.headline16c666666tyleMontserratW600.copyWith(
                color: AppColors.cFFFFFF, fontSize: 24.sp
              ),
              );

            }
            
          }
        ),
        UIHelper.verticalSpace(4.h),
    
        Text(
          "Welcome to Pos-Well",
          style: TextFontStyle.headline16c333333tyleMontserratW400.copyWith(
            color: AppColors.cFFFFFF, fontSize: 14.sp
          ),
          )
      ],),
    );
  }
}