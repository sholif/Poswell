// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/features/home/model/all_couses_response_model.dart';
import 'package:poswell_app/features/home/model/recommended_courses_response_model.dart';
import 'package:poswell_app/features/home/widgets/home_banner_widgets.dart';
import 'package:poswell_app/features/recommended_plan/widget/recommended_course_tile_widget.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/all_routes.dart';
import 'package:poswell_app/helpers/navigation_service.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';
import 'package:poswell_app/networks/api_acess.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    super.initState();
    getProfileRXOBJ.getProfile();
    getAllCoursesRXOBJ.getAllCourses();
    getRecommendedCoursesRXOBJ.getRecommendedCourses();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          UIHelper.verticalSpace(15.h),
          const HomeBannerWidget(),
          UIHelper.verticalSpace(20.h),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
            child: Text(
              "Recommended for you",
              style: TextFontStyle.headline24c57AE8EStyleMulishW700
                  .copyWith(color: AppColors.c1E1E1E, fontSize: 18.sp),
            ),
          ),
          UIHelper.verticalSpace(20.h),
          StreamBuilder(
            stream: getRecommendedCoursesRXOBJ.recommendedCoursesStream,
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting || snapshot.data ==null ){
                return const SizedBox.shrink();
              } else{
                RecommendedResponseModel data = snapshot.data;
                return Column(
                  children: [
                    ListView.builder(
                      itemCount: data.data!.length,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          child: RecommendedCourseTileWidget(
                            onTap: () {
                                NavigationService.navigateToWithArgs(Routes.courseDetailsScreen, {'id': data.data![index].courseId.toString(), 'title': data.data![index].course!.name.toString()});
                            },
                            title: data.data![index].course!.name!,
                            totlaModuld: data.data![index].course!.modulesCount.toString(),
                            totalMinuts: "WA",
                            imagePath: data.data![index].course!.imageUrl!,
                          ),
                        );
                      }),
                  ],
                );

              }

              
            }
          ),
          UIHelper.verticalSpace(20.h),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
            child: Text(
              "Other Programs",
              style: TextFontStyle.headline24c57AE8EStyleMulishW700
                  .copyWith(color: AppColors.c1E1E1E, fontSize: 18.sp),
            ),
          ),
          UIHelper.verticalSpace(20.h),
          StreamBuilder(
            stream: getAllCoursesRXOBJ.allCoursesStream,
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting || snapshot.data ==null ){
                return const SizedBox.shrink();
              } else{
                AllCoursesResponseModel data = snapshot.data;
                return ListView.builder(
                  itemCount: data.data!.length,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                      child: RecommendedCourseTileWidget(
                        onTap: () {
                           NavigationService.navigateToWithArgs(Routes.courseDetailsScreen, {'id': data.data![index].id.toString(), 'title': data.data![index].name.toString()});
                        },
                        title: data.data![index].name??"",
                        totlaModuld:  data.data![index].modulesCount.toString(),
                        totalMinuts: "W2",
                        imagePath: data.data![index].imageUrl??"",
                      ),
                    );
                  });

              }
              
            }
          ),
        ],
      ),
    );
  }
}