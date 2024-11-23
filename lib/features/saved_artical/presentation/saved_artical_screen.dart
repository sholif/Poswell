import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/features/course_details/widgets/artical_card_widget.dart';
import 'package:poswell_app/features/saved_artical/model/bookmark_model.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/all_routes.dart';
import 'package:poswell_app/helpers/navigation_service.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';
import 'package:poswell_app/networks/api_acess.dart';
import 'package:poswell_app/networks/endpoints.dart';

class SavedArticalScreen extends StatefulWidget {
  const SavedArticalScreen({super.key});

  @override
  State<SavedArticalScreen> createState() => _SavedArticalScreenState();
}

class _SavedArticalScreenState extends State<SavedArticalScreen> {
  @override
  void initState() {
    super.initState();
    getBookMarkResponseRx.getBookmark();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UIHelper.verticalSpace(45.h),
          Text(
            "Saved Articles",
            style: TextFontStyle.headline16c666666tyleMontserratW600
                .copyWith(color: AppColors.c1E1E1E, fontSize: 18.sp),
          ),
          UIHelper.verticalSpace(10.h),
          Expanded(
              child: StreamBuilder(
            stream: getBookMarkResponseRx.dataFetcher,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("No saved articles"),
                );
              } else if (snapshot.hasData) {
                BookmarkModel bookmarkModel = snapshot.data!;
                final data = bookmarkModel.data!;

                return ListView.builder(
                  itemCount: data.length,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return ArticalCartWidget(
                        onTap: () {
                                   NavigationService.navigateToWithArgs(Routes.articalDetailsScreen,{
                                    "id": data[index].id
                                   });

                        },
                        title: "${data[index].title}",
                        description: "5 min read",
                        imagePath: "${imageUrl}/${data[index].imageUrl}");
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          )),
        ],
      ),
    );
  }
}
