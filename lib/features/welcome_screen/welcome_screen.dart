import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/constants/app_constants.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/features/welcome_screen/model/welcome_model.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/all_routes.dart';
import 'package:poswell_app/helpers/di.dart';
import 'package:poswell_app/helpers/navigation_service.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isFinished = false;
  PageController controller = PageController();

  List<WelcomeModel> onboardingList = [
    WelcomeModel(
      title: "Empower Your Independence",
      desciption:
          "Taking charge of your own life and decisions; confidently resisting societal pressures to conform and staying true to your own beliefs and values; regulating your actions from within, guided by personal standards",
      imagePath: Assets.images.onboarding1,
    ),
    WelcomeModel(
      title: "Cultivate a Positive and Supportive Outlook Towards Self",
      desciption:
          "Positive attitude toward the self; acknowledgment and acceptance of multiple aspects of self, including good and bad qualities; positive feelings about one’s past",
      imagePath: Assets.images.onboarding2,
    ),
    WelcomeModel(
      title: "Build Meaningful Connections",
      desciption:
          "Creating warm, fulfilling relationships based on trust and mutual satisfaction; genuinely caring about others' well-being; having a strong capacity for empathy, affection, and intimacy; understanding the importance of give-and-take in relationships.",
      imagePath: Assets.images.onboarding3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView.builder(
              onPageChanged: (int pageIndex) {
                if (pageIndex == 2) {
                  setState(() {
                    isFinished = true;
                  });
                } else {
                  setState(() {
                    isFinished = false;
                  });
                }
              },
              controller: controller,
              itemCount: onboardingList.length,
              // physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return BodyWidget(
                  title: onboardingList[index].title,
                  description: onboardingList[index].desciption,
                  imagePath: onboardingList[index].imagePath,
                );
              }),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                   appData.write(kKeyIsFirst, false);
                   NavigationService.navigateTo(Routes.authScreen);
                },
                child: Container(
                  height: 37.h,
                  width: 103.w,
                  decoration: BoxDecoration(
                      color: AppColors.cFFFFFF,
                      borderRadius: BorderRadius.circular(18.r),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.c000000.withOpacity(0.15),
                            blurRadius: 10.sp)
                      ]),
                  alignment: Alignment.center,
                  child: Text(
                    "Skip",
                    style: TextFontStyle.headline16c666666tyleMontserratW600,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (!isFinished) {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear);
                  }else{
                    appData.write(kKeyIsFirst, false);
                    NavigationService.navigateTo(Routes.authScreen);
                  }
                },
                child: Container(
                  height: 37.h,
                  width: 103.w,
                  decoration: BoxDecoration(
                    color: AppColors.c57AE8F,
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    isFinished ? "Let’s go" : "Next",
                    style: TextFontStyle.headline16c666666tyleMontserratW600
                        .copyWith(color: AppColors.cF1F0F0),
                  ),
                ),
              )
            ],
          ),
        ),
        UIHelper.verticalSpaceMedium
      ],
    ));
  }
}

class BodyWidget extends StatelessWidget {
  final String title, description, imagePath;
  const BodyWidget({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30.h,
          color: AppColors.cFFFFFF,
        ),
        SizedBox(
            // height: 480.h,
            width: double.maxFinite,
            child: SvgPicture.asset(
              imagePath,
              fit: BoxFit.cover,
            )),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextFontStyle.headline24c57AE8EStyleMulishW700,
          ),
        ),
        UIHelper.verticalSpace(20.h),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextFontStyle.headline16c333333tyleMontserratW500,
          ),
        ),
      ],
    );
  }
}
