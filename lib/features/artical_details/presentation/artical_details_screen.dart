// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/features/artical_details/model/single_article_model.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/helpers/navigation_service.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';
import 'package:poswell_app/networks/api_acess.dart';
import 'package:poswell_app/networks/endpoints.dart';

import '../../../gen/colors.gen.dart';

class ArticalDetailsScreen extends StatefulWidget {
  final int id;
  const ArticalDetailsScreen({super.key, required this.id});

  @override
  State<ArticalDetailsScreen> createState() => _ArticalDetailsScreenState();
}

class _ArticalDetailsScreenState extends State<ArticalDetailsScreen> {
  @override
  void initState() {
    super.initState();
    getSingleArticleRx.getSingleArticle(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: getSingleArticleRx.dataFetcher,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            SingleArticleModel singleArticleModel= snapshot.data!;
            final data= singleArticleModel.data!;
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 226.h,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.c000000.withOpacity(0.25),
                            blurRadius: 6.sp,
                            offset: const Offset(00, 1),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: FadeInImage.assetNetwork(
                    height: 100,
                    width: 140,
                    placeholder: Assets.images.placeholderImage
                        .path, // Path to your local placeholder image
                    image: "${imageUrl}/${data.imageUrl}", // Network image URL
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(Assets.images.placeholderImage.path,
                          fit: BoxFit.cover);
                    },
                  ),
                    ),
                    Positioned(
                        top: 40.h,
                        right: UIHelper.kDefaulutPadding(),
                        left: UIHelper.kDefaulutPadding(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () => NavigationService.goBack,
                                child: SvgPicture.asset(
                                  Assets.icons.backArrow,
                                  color: AppColors.cFFFFFF,
                                )),
                            SvgPicture.asset(Assets.icons.bookmark),
                          ],
                        )),
                    Positioned(
                        top: 120.h,
                        right: 60.w,
                        left: 60.w,
                        child: Text(
                          "${data.title}",
                          textAlign: TextAlign.center,
                          style: TextFontStyle
                              .headline16c666666tyleMontserratW700
                              .copyWith(
                                  color: AppColors.cFFFFFF, fontSize: 22.sp),
                        ))
                  ],
                ),
                UIHelper.verticalSpace(24.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: UIHelper.kDefaulutPadding()),
                  child: Text(
                    "${data.description}",
                    style: TextFontStyle.headline16c333333tyleMontserratW400
                        .copyWith(color: AppColors.c616161),
                  ),
                ),
                UIHelper.verticalSpace(24.h),

                // UIHelper.verticalSpace(24.h),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 120.h,
        child: const AudioPlayerControllerWidget(),
      ),
    );
  }
}

class AudioPlayerControllerWidget extends StatelessWidget {
  const AudioPlayerControllerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 6.h,
                thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: 8.sp,
                ),
                activeTrackColor: AppColors.c57AE8F,
                inactiveTrackColor: AppColors.cD9D9D9,
                thumbColor: AppColors.c57AE8F,
              ),
              child: Slider(value: 0.4, onChanged: (value) {}),
            ),
            Positioned(
                right: 25.h,
                bottom: 0,
                child: Text(
                  "03:50",
                  style: TextFontStyle.headline10c666666tyleMondaW400,
                ))
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(Assets.icons.previousButton),
          UIHelper.horizontalSpace(45.h),
          CircleAvatar(
            radius: 30.r,
            backgroundColor: AppColors.allPrimaryColor,
            child: Icon(
              Icons.play_arrow_rounded,
              size: 48.h,
              color: AppColors.cFFFFFF,
            ),
          ),
          UIHelper.horizontalSpace(45.h),
          SvgPicture.asset(Assets.icons.nextButton),
        ])
      ],
    );
  }
}
