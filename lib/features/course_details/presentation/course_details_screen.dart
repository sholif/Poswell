import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/common_widget/custom_app_bar.dart';
import 'package:poswell_app/features/course_details/model/course_article_response_model.dart';
import 'package:poswell_app/features/course_details/model/course_module_response_model.dart';
import 'package:poswell_app/features/course_details/model/daily_read_article_response_model.dart';
import 'package:poswell_app/features/course_details/widgets/artical_card_widget.dart';
import 'package:poswell_app/features/course_details/widgets/custom_goal_card.dart';
import 'package:poswell_app/features/course_details/widgets/daily_artical_widget.dart';
import 'package:poswell_app/features/course_details/widgets/module_tile_widget.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/helpers/all_routes.dart';
import 'package:poswell_app/helpers/navigation_service.dart';
import 'package:poswell_app/helpers/toast.dart';
import 'package:poswell_app/networks/api_acess.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';

class CourseDetailsScreen extends StatefulWidget {
  final String cId, title;
  const CourseDetailsScreen({super.key, required this.cId, required this.title});

  static List<String> dailyArticalList = [
    Assets.images.image1.path,
    Assets.images.image2.path,
  ];
  static List<String> popilarArticalList = [
    Assets.images.p1.path,
    Assets.images.p2.path,
    Assets.images.p3.path,
    Assets.images.p1.path,
    Assets.images.p2.path,
    Assets.images.p3.path,
  ];

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {



  @override
  void initState() {
    super.initState();
    getCourseModuleRXOBJ.getCourseModules(id: widget.cId);
    getCourseArticleRXOBJ.getCourseModules(id: widget.cId);
    getDailyReadArticleRXOBJ.getDaillyReadArticles(id: widget.cId);
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: Column(
        children: [
          UIHelper.verticalSpace(25.h),
          CustomAppbar(
            showBack: true,
            name: widget.title,
            trailingWidget: SvgPicture.asset(
              Assets.images.course1,
              width: 40.w,
              fit: BoxFit.cover,
            ),
          ),
          UIHelper.verticalSpace(8.h),
          tabBarWidget(),
          Expanded(
            child: TabBarView(
              children: [
                const ModulesListWidget(),
                ArticalListWidget(
                    dailyArticalList: CourseDetailsScreen.dailyArticalList,
                    popilarArticalList: CourseDetailsScreen.popilarArticalList)
              ],
            ),
          )
        ],
      )),
    );
  }

  Container tabBarWidget() {
    return Container(
      width: double.infinity,
      height: 55.h,
      constraints: BoxConstraints(maxHeight: 50.h),
      padding: EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
      child: Stack(
        children: [
          SizedBox(
            height: 55.h,
          ),
          const Positioned(
              bottom: -5.8,
              right: 0,
              left: 0,
              child: Divider(
                color: AppColors.allPrimaryColor,
                // height: 1.h,
              )),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: TabBar(
              // dividerColor: AppColors.allPrimaryColor,
              indicatorColor: AppColors.allPrimaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: AppColors.allPrimaryColor,
              indicatorWeight: 3.h,
              labelStyle: TextFontStyle.headline16c666666tyleMontserratW600
                  .copyWith(fontSize: 14.sp, color: AppColors.allPrimaryColor),
              unselectedLabelStyle: TextFontStyle
                  .headline16c666666tyleMontserratW600
                  .copyWith(fontSize: 14.sp, color: AppColors.cA7A7A7),

              tabs: const [
                Tab(text: "Modules"),
                Tab(text: "Articles"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ArticalListWidget extends StatelessWidget {
  const ArticalListWidget({
    super.key,
    required this.dailyArticalList,
    required this.popilarArticalList,
  });

  final List<String> dailyArticalList;
  final List<String> popilarArticalList;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
          child: Text(
            "Your Daily Read",
            style: TextFontStyle.headline16c666666tyleMontserratW600
                .copyWith(fontSize: 18.sp, color: AppColors.c1E1E1E),
          ),
        ),
        UIHelper.verticalSpace(16.h),
        StreamBuilder(
          stream: getDailyReadArticleRXOBJ.dailyReadArticlesStream,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting || snapshot.data == null){
              return const SizedBox.shrink();
            }else {
              DailyReadArticleResponseModel data = snapshot.data;
              return SizedBox(
              height: 190.h,
              width: double.maxFinite,
              child: ListView.builder(
                  itemCount: data.data!.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        NavigationService.navigateTo(Routes.articalDetailsScreen);
                      },
                      child: DailyArticalWidget(
                        isLastItem: index == data.data!.length-1,
                        title: data.data![index].title??"",
                        description: "WFA",
                        imagePath: data.data![index].imageUrl??"",
                      ),
                    );
                  }),
            );

            }
            
          }
        ),
        UIHelper.verticalSpace(10.h),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
          child: Text(
            "Popular Articles",
            style: TextFontStyle.headline16c666666tyleMontserratW600
                .copyWith(fontSize: 18.sp, color: AppColors.c1E1E1E),
          ),
        ),
        UIHelper.verticalSpace(8.h),
        StreamBuilder(
          stream: getCourseArticleRXOBJ.courseArticleStream,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting || snapshot.data == null){
              return const SizedBox.shrink();
            }
            else{
              CoursesArticleResponseModel data = snapshot.data;
              return ListView.builder(
                itemCount: data.data!.articles!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ArticalCartWidget(
                      onTap: () {
                        // NavigationService.navigateTo(Routes.articalDetailsScreen);
                        log("===> ${data.data!.articles![index].id!}");
                      },
                      title: data.data!.articles![index].title??"",
                      description: "WFA",
                      imagePath:data.data!.articles![index].imageUrl??"" );
                });

            }
            
          }
        ),
        UIHelper.verticalSpace(16.h),
      ],
    );
  }
}

class ModulesListWidget extends StatelessWidget {
  const ModulesListWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getCourseModuleRXOBJ.courseModulesStream,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting || snapshot.data == null ){
          return SizedBox.fromSize();
        }else{
          CoursesModuleResponseModel data = snapshot.data;
           return ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: data.data!.modules!.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  if (index == 0)
                    InkWell(
                      onTap: () => NavigationService.navigateTo(Routes.goalDetailsScreen),
                      child: const CustomGoalCard(
                        completeCourses: 8,
                        totalCourses: 10,
                      ),
                    ),
                  GestureDetector(
                    onTap: () {
                      if(data.data!.modules![index].access != "open"){
                        ToastUtil.showShortToast("Please complete the previous modules to access this");
                      } else if (data.data!.modules![index].isExam == 1) {
                        NavigationService.navigateTo(Routes.taskScreen);
                      } else {
                        Module moduleData = data.data!.modules![index];
                        NavigationService.navigateToWithArgs(Routes.moduleDetailsScreen, {'data': moduleData} );
                      }
                    },
                    child: ModuleTileWidget(
                      isTask:data.data!.modules![index].isExam == 1,
                      moduleNumber: (index + 1).toString(),
                      title:data.data!.modules![index].title??"0.00",
                      duration: data.data!.modules![index].audioTime??"0.00",
                      isAccessable: data.data!.modules![index].access == "open",
                    ),
                  ),
                ],
              );
            });

        }
       
      }
    );
  }
}


