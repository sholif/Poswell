import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/common_widget/audio_player.dart';
import 'package:poswell_app/common_widget/logo_widget.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/features/course_details/model/course_module_response_model.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/all_routes.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

import '../../../common_widget/auth_button.dart';
import '../../../gen/assets.gen.dart';
import '../../../helpers/navigation_service.dart';

class ModulesDetailsScreen extends StatelessWidget {
  final Module moduleData;
  const ModulesDetailsScreen({
    super.key,
    required this.moduleData
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UIHelper.verticalSpace(55.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () => NavigationService.goBack,
                    child: SvgPicture.asset(Assets.icons.backArrow)),
                const LogoWidget(),
                Container(
                  width: 22.w,
                )
              ],
            ),
          ),
          UIHelper.verticalSpace(24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding() ),
            child: Text(
              moduleData.title??"",
              style: TextFontStyle.headline16c666666tyleMontserratW600
                  .copyWith(fontSize: 18.sp, color: AppColors.c4D4D4D),
            ),
          ),
          UIHelper.verticalSpace(12.h),

          Expanded(
            child: Padding(
             padding: EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding() ),
            
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  Text(
                    // "The course on Empowering Independence focuses on developing the essential skill of autonomy, which is the ability to take charge of one's life, make independent decisions, and resist societal pressures to conform. Participants will learn to confidently embrace their own beliefs and values, regulate their actions from within, and navigate life based on personal standards. Through a combination of theoretical concepts, practical exercises, and real-life examples, this course aims to empower individuals to become self-directed and assertive in shaping their own lives.",
                    moduleData.content??"",
                    style: TextFontStyle.headline16c333333tyleMontserratW400
                        .copyWith(fontSize: 14.sp, color: AppColors.c616161),
                  ),
                ],
              ),
            ),
          ),
          // UIHelper.verticalSpace(48.h),
          // const AudioPlayerControllerWidget()
           AudioPlayerWidget(audioUrl: "${moduleData.fileUrl}")
          
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
        child: AuthCustomeButton(
              onCallBack: () {
                NavigationService.navigateToWithArgs(Routes.subscriptionScreen, {'data': true});
              },
              name: "Next Module",
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
