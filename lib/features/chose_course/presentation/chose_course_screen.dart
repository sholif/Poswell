// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/common_widget/course_tile_widget.dart';
import 'package:poswell_app/common_widget/logo_widget.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/features/chose_course/model/course_type_model.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/all_routes.dart';
import 'package:poswell_app/helpers/navigation_service.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';
import 'package:poswell_app/networks/api_acess.dart';
import 'package:poswell_app/networks/endpoints.dart';

class ChoseCoursesScreen extends StatefulWidget {
  const ChoseCoursesScreen({super.key});

  @override
  State<ChoseCoursesScreen> createState() => _ChoseCoursesScreenState();
}

class _ChoseCoursesScreenState extends State<ChoseCoursesScreen> {
  @override
  void initState() {
    super.initState();
    getCourseTypeRxObj.getCourseType();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UIHelper.verticalSpace(45.h),
          const LogoWidget(),
          UIHelper.verticalSpace(32.h),
          Center(
            child: Text(
              "Choose your programs type",
              style: TextFontStyle.headline16c333333tyleMontserratW500
                  .copyWith(color: AppColors.c1E1E1E, fontSize: 14.sp),
            ),
          ),
          UIHelper.verticalSpace(20.h),
          StreamBuilder(
            stream: getCourseTypeRxObj.dataFetcher,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                GetCourseType getCourseType = snapshot.data!;
                final data = getCourseType.data ?? [];

                return ListView.separated(
                  separatorBuilder: (context, index) =>
                      UIHelper.verticalSpaceSmall,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return CourseTileWidget(
                      onTap: () {
                        NavigationService.navigateToWithArgs(Routes.questionScreen,{
                          "id": data[index].id
                        });
                      },
                      title: "${data[index].name}",
                      imagePath: "${imageUrl}/${data[index].image}",
                    );
                  },
                );
              } else {
                // Display a loader or any other fallback widget here if needed
                return const SizedBox.shrink();
              }
            },
          )
        ],
      ),
    );
  }
}
