import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/features/question/model/survey_mark_model.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/helpers/navigation_service.dart';
import 'package:poswell_app/networks/api_acess.dart';

import '../../../common_widget/auth_button.dart';
import '../../../common_widget/logo_widget.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/ui_helpers.dart';

class ScoreScreen extends StatefulWidget {
  final int id;
  const ScoreScreen({super.key, required this.id});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  void initState() {
    super.initState();
    getSurveyMarkRxObj.getSurveyMark(widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UIHelper.verticalSpace(45.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding() ),
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
          UIHelper.verticalSpace(16.h),
          Container(
             margin:  EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding() ),
            height: 51.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: AppColors.cDBFFF2,
                borderRadius: BorderRadius.circular(10.r)),
            alignment: Alignment.center,
            child: Text(
              "Well-Being Score",
              style: TextFontStyle.headline40cBE5F4FStyleMulishW600
                  .copyWith(fontSize: 18.sp, color: AppColors.c57AE8F),
            ),
          ),
          UIHelper.verticalSpace(12.h),
          Expanded(
              child: StreamBuilder(
                stream: getSurveyMarkRxObj.dataFetcher, 
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                  SurveyMarkModel surveyMarkModel= snapshot.data!;
                  final data= surveyMarkModel.data??[];
                    return ListView.builder(
                padding: EdgeInsets.zero,
                  shrinkWrap: true, physics: const BouncingScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) => ScoreTileWidget(
                    title: data[index].courseName.toString(),
                    score: data[index].mark.toString(),
                  )
                      );
                  } else{
                    return const SizedBox.shrink();
                  }
                },
                )
                      )
        ],
      ),
      bottomNavigationBar: Container(
                padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
                child: AuthCustomeButton(
                    onCallBack: () {
                      NavigationService.navigateTo(Routes.recommendedPlanScreen);
                    },
                    name: "Choose Recommended Plan",
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

class ScoreTileWidget extends StatelessWidget {
  final String title, score;
  const ScoreTileWidget({
    super.key,
    required this.title,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 51.h,
          width: double.maxFinite,
          margin: EdgeInsets.symmetric(
            vertical: 12.h,
            horizontal: UIHelper.kDefaulutPadding()
          ),
          decoration: BoxDecoration(
            color: AppColors.cFFFFFF,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.c000000.withOpacity(0.15),
                blurRadius: 4.sp,
                spreadRadius: 0,
              )
            ],
          ),
          padding: EdgeInsets.symmetric(
            horizontal: UIHelper.kDefaulutPadding()
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextFontStyle.headline40cBE5F4FStyleMulishW600.copyWith(
                  color: AppColors.c57AE8F, fontSize: 18.sp
                ),
                ),
              Text(
                score,
                style: TextFontStyle.headline40cBE5F4FStyleMulishW600.copyWith(
                  color: AppColors.c57AE8F, fontSize: 18.sp
                ),
                )
            ],
          ),
        );
  }
}
