import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/all_routes.dart';
import 'package:poswell_app/helpers/navigation_service.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

import '../model/dummy_chat_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  static List<DummyChatModel> chatList = [
    DummyChatModel(
        title: "Alex Linderson",
        lastMessage: "How are you today?",
        time: "2 min ago",
        imageUrl: Assets.images.user1.path,
        unreadCount: 2),
    DummyChatModel(
        title: "John Ahraham",
        lastMessage: "Hey! Can you join the meeting?",
        time: "2 min ago",
        imageUrl: Assets.images.user2.path,
        unreadCount: 0),
    DummyChatModel(
        title: "Sabila Sayma",
        lastMessage: "How are you today?",
        time: "2 min ago",
        imageUrl: Assets.images.user3.path,
        unreadCount: 0),
    DummyChatModel(
        title: "Alex Linderson",
        lastMessage: "How are you today?",
        time: "2 min ago",
        imageUrl: Assets.images.user1.path,
        unreadCount: 0),
    DummyChatModel(
        title: "John Ahraham",
        lastMessage: "Hey! Can you join the meeting?",
        time: "2 min ago",
        imageUrl: Assets.images.user2.path,
        unreadCount: 0),
    DummyChatModel(
        title: "Angel Dayna",
        lastMessage: "How are you today?",
        time: "2 min ago",
        imageUrl: Assets.images.user4.path,
        unreadCount: 0),
    DummyChatModel(
        title: "Alex Linderson",
        lastMessage: "How are you today?",
        time: "2 min ago",
        imageUrl: Assets.images.user1.path,
        unreadCount: 0),
    DummyChatModel(
        title: "John Ahraham",
        lastMessage: "Hey! Can you join the meeting?",
        time: "2 min ago",
        imageUrl: Assets.images.user2.path,
        unreadCount: 0),
    DummyChatModel(
        title: "Sabila Sayma",
        lastMessage: "How are you today?",
        time: "2 min ago",
        imageUrl: Assets.images.user3.path,
        unreadCount: 0),
    DummyChatModel(
        title: "Alex Linderson",
        lastMessage: "How are you today?",
        time: "2 min ago",
        imageUrl: Assets.images.user1.path,
        unreadCount: 0),
    DummyChatModel(
        title: "John Ahraham",
        lastMessage: "Hey! Can you join the meeting?",
        time: "2 min ago",
        imageUrl: Assets.images.user2.path,
        unreadCount: 0),
    DummyChatModel(
        title: "Angel Dayna",
        lastMessage: "How are you today?",
        time: "2 min ago",
        imageUrl: Assets.images.user4.path,
        unreadCount: 0),
    DummyChatModel(
        title: "Alex Linderson",
        lastMessage: "How are you today?",
        time: "2 min ago",
        imageUrl: Assets.images.user1.path,
        unreadCount: 0),
    DummyChatModel(
        title: "John Ahraham",
        lastMessage: "Hey! Can you join the meeting?",
        time: "2 min ago",
        imageUrl: Assets.images.user2.path,
        unreadCount: 0),
    DummyChatModel(
        title: "Sabila Sayma",
        lastMessage: "How are you today?",
        time: "2 min ago",
        imageUrl: Assets.images.user3.path,
        unreadCount: 0),
    DummyChatModel(
        title: "Alex Linderson",
        lastMessage: "How are you today?",
        time: "2 min ago",
        imageUrl: Assets.images.user1.path,
        unreadCount: 0),
    DummyChatModel(
        title: "John Ahraham",
        lastMessage: "Hey! Can you join the meeting?",
        time: "2 min ago",
        imageUrl: Assets.images.user2.path,
        unreadCount: 0),
    DummyChatModel(
        title: "Angel Dayna",
        lastMessage: "How are you today?",
        time: "2 min ago",
        imageUrl: Assets.images.user4.path,
        unreadCount: 0),
    DummyChatModel(
        title: "Alex Linderson",
        lastMessage: "How are you today?",
        time: "2 min ago",
        imageUrl: Assets.images.user1.path,
        unreadCount: 0),
    DummyChatModel(
        title: "John Ahraham",
        lastMessage: "Hey! Can you join the meeting?",
        time: "2 min ago",
        imageUrl: Assets.images.user2.path,
        unreadCount: 0),
    DummyChatModel(
        title: "Sabila Sayma",
        lastMessage: "How are you today?",
        time: "2 min ago",
        imageUrl: Assets.images.user3.path,
        unreadCount: 0),
    DummyChatModel(
        title: "Alex Linderson",
        lastMessage: "How are you today?",
        time: "2 min ago",
        imageUrl: Assets.images.user1.path,
        unreadCount: 0),
    DummyChatModel(
        title: "John Ahraham",
        lastMessage: "Hey! Can you join the meeting?",
        time: "2 min ago",
        imageUrl: Assets.images.user2.path,
        unreadCount: 0),
    DummyChatModel(
        title: "Angel Dayna",
        lastMessage: "How are you today?",
        time: "2 min ago",
        imageUrl: Assets.images.user4.path,
        unreadCount: 0),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.allPrimaryColor,
      body: Column(
        children: [
          UIHelper.verticalSpace(50.h),
          Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: UIHelper.kDefaulutPadding()
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 44.h,
                  width: 44.h,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(44.r),
                      child: Image.asset(
                        Assets.images.profileImage.path,
                        fit: BoxFit.cover,
                      )),
                ),
                Text(
                  "Chat",
                  style: TextFontStyle.headline16c666666tyleMontserratW600
                      .copyWith(color: AppColors.cFFFFFF, fontSize: 18.sp),
                ),
                Container(
                    width: 44.h,
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset(Assets.icons.searchIcon))
              ],
            ),
          ),
          UIHelper.verticalSpace(20.h),
          Expanded(
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: AppColors.cFFFFFF,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  )),
              child: ListView.builder(
                  itemCount: chatList.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        NavigationService.navigateTo(Routes.conversationScreen);
                      },
                      child: CustomChatTileWidget(
                        title: chatList[index].title,
                        time: chatList[index].time,
                        lastMessage: chatList[index].lastMessage,
                        imageUrl: chatList[index].imageUrl,
                        unreadCount: chatList[index].unreadCount,
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

class CustomChatTileWidget extends StatelessWidget {
  final String title, lastMessage, time, imageUrl;
  final int unreadCount;
  const CustomChatTileWidget({
    super.key,
    required this.title,
    required this.lastMessage,
    required this.time,
    required this.imageUrl,
    required this.unreadCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: UIHelper.kDefaulutPadding(), vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 52.h,
            width: 52.h,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(52.r),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                )),
          ),
          UIHelper.horizontalSpace(12.h),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UIHelper.verticalSpace(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextFontStyle.headline16c333333tyleMontserratW500
                        .copyWith(
                            color: AppColors.c1E1E1E,
                            fontSize: 16.sp,
                            height: 0.08.h),
                  ),
                  Text(
                    time,
                    style: TextFontStyle.headline16c333333tyleMontserratW500
                        .copyWith(
                            color: AppColors.c797C7B,
                            fontSize: 12.sp,
                            height: 0.08.h),
                  ),
                ],
              ),
              UIHelper.verticalSpace(unreadCount > 0 ? 12.h : 20.h),
              Row(
                children: [
                  Text(
                    lastMessage,
                    style: TextFontStyle.headline16c333333tyleMontserratW400
                        .copyWith(
                            color: AppColors.c797C7A,
                            fontSize: 12.sp,
                            height: 0.08.h),
                  ),
                  const Spacer(),
                  if (unreadCount > 0)
                    Container(
                        height: 20.h,
                        width: 20.h,
                        decoration: const BoxDecoration(
                            color: AppColors.cF04A4C, shape: BoxShape.circle),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(2.sp),
                        child: Text(
                          unreadCount.toString(),
                          style: TextFontStyle
                              .headline16c333333tyleMontserratW400
                              .copyWith(
                            color: AppColors.cFFFFFF,
                            fontSize: 11.sp,
                          ),
                        )),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
