import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/common_widget/logo_widget.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/features/recommended_plan/model/recomended_course.dart';
import 'package:poswell_app/features/recommended_plan/widget/recommended_course_tile_widget.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/all_routes.dart';
import 'package:poswell_app/helpers/navigation_service.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';
import 'package:poswell_app/networks/api_acess.dart';

import '../../../common_widget/custom_button.dart';

class RecommendedPlanScreen extends StatefulWidget {
  const RecommendedPlanScreen({super.key});

  @override
  State<RecommendedPlanScreen> createState() => _RecommendedPlanScreenState();
}

class _RecommendedPlanScreenState extends State<RecommendedPlanScreen> {

  

  @override
  void initState() {
    super.initState();
    getRecomendedCourseRxObj.getCourse();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UIHelper.verticalSpace(45.h),
          const LogoWidget(),
          UIHelper.verticalSpace(32.h),
          Text(
            "Programs that we recommend to you",
            style: TextFontStyle.headline16c333333tyleMontserratW500
                .copyWith(color: AppColors.c1E1E1E, fontSize: 14.sp),
          ),
          UIHelper.verticalSpace(20.h),
          StreamBuilder(
            stream: getRecomendedCourseRxObj.dataFetcher,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                Recomendedcourse recomendedcourse= snapshot.data!;
                final data= recomendedcourse.data!;
                return ListView.separated(
                  
                  separatorBuilder: (context, index) => UIHelper.verticalSpaceSmall,
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return RecommendedCourseTileWidget(
                  onTap: () =>
                      NavigationService.navigateTo(Routes.courseDetailsScreen),
                  title: "${data[index].course?.name}",
                  totlaModuld: "${data[index].course?.modulesCount}",
                  totalMinuts: "124",
                  imagePath: "${data[index].course?.imageUrl}"
                );
                  },
                  );
              } else{
                return const SizedBox.shrink();
              }
            },
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: UIHelper.kDefaulutPadding(), horizontal: 80.w),
            child: customeButton(
                icon: SvgPicture.asset(Assets.icons.homeIcon),
                name: "Back To Home",
                onCallBack: () {
                  NavigationService.navigateTo(Routes.navigationScreen);
                },
                height: 56.h,
                minWidth: double.infinity,
                borderRadius: 8.r,
                borderColor: AppColors.allPrimaryColor,
                color: AppColors.cFFFFFF,
                textStyle: TextFontStyle.headline16c333333tyleMontserratW500
                    .copyWith(
                        color: AppColors.allPrimaryColor, fontSize: 18.sp),
                context: context),
          )
        ],
      ),
    );
  }
}
