import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/navigation_service.dart';
import '../../../constants/text_font_style.dart';
import '../../../helpers/ui_helpers.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {

  static List<String> messageList = [
    "Hello! Jhon abraham",
    "Hello ! Nazrul How are you?",
    "You did your job well!",
    "Have a great working week!!"
  ];

 final  TextEditingController controller = TextEditingController();

 @override
  void initState() {
    super.initState();
    controller.addListener((){
      

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UIHelper.verticalSpace(40.h),
          const CoversationAppBarWidget(),
          Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                      itemCount: messageList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                        horizontal: UIHelper.kDefaulutPadding()
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:  EdgeInsets.symmetric(vertical: 10.h),
                          child: Row(
                            mainAxisAlignment: index % 2 ==0? MainAxisAlignment.end: MainAxisAlignment.start,
                            children: [
                             if(index % 2 !=0) SizedBox(
                                height: 44.h,
                                width: 44.h,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(52.r),
                                    child: Image.asset(
                                      Assets.images.user2.path,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              UIHelper.horizontalSpace(22.h),
                              Column(
                                crossAxisAlignment:  index % 2 !=0 ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                                children: [
                                  UIHelper.verticalSpace(20.h),
                                  Container(
                                    height: 36.h,
                                    padding: EdgeInsets.all(10.sp),
                                    margin: EdgeInsets.only(
                                      right: index % 2 ==0 ? 0: 60.h,
                                      left: index % 2 !=0 ? 0: 60.h
                                    ),
                                    decoration: BoxDecoration(
                                      color: index % 2 !=0? AppColors.cF2F7FB : AppColors.allPrimaryColor,
                                      borderRadius: index % 2 !=0 ? BorderRadius.only(
                                        topRight: Radius.circular(15.r),
                                        bottomLeft: Radius.circular(15.r),
                                        bottomRight: Radius.circular(15.r),
                                      ) : BorderRadius.only(
                                        topLeft: Radius.circular(15.r),
                                        bottomLeft: Radius.circular(15.r),
                                        bottomRight: Radius.circular(15.r),
                                      )
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      messageList[index],
                                      style: TextFontStyle.headline16c333333tyleMontserratW400.copyWith(
                                        color:index % 2 !=0? AppColors.c1E1E1E : AppColors.cFFFFFF , fontSize: 12.sp
                                      ),
                                      ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),

                      Positioned(
                        bottom: 0, right: 0, left: 0,
                        child: Container(
                        height: 70.h, width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: AppColors.cFFFFFF,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.c000000.withOpacity(0.15),
                              blurRadius: 1.sp,
                              offset: const Offset(00, -01)
                            )
                          ]
                        ),
                        child: ChatBottomBarWidget(
                          onSendTap: (){},
                          chatController: controller,
                        ),
                      ))
                ],
              ))
        ],
      ),
    );
  }
}

class ChatBottomBarWidget extends StatefulWidget {
  final Function() onSendTap;
  
  final TextEditingController chatController;
  const ChatBottomBarWidget({
    super.key,
    required this.onSendTap,
    required this.chatController,
  });

  @override
  State<ChatBottomBarWidget> createState() => _ChatBottomBarWidgetState();
}

class _ChatBottomBarWidgetState extends State<ChatBottomBarWidget> {
   bool showIcons = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
      
      child: Row(
        children: [

          GestureDetector(
            onTap: (){},
            child: SvgPicture.asset(
              Assets.icons.attachment,
              width: 24.w,
            ),
          ),
          // UIHelper.horizontalSpaceSmall,
          // GestureDetector(
          //   onTap: onImageTap,
          //   child: SvgPicture.asset(
          //     Assets.icons.imageIcon,
          //     width: 32.w,
          //   ),
          // ),
          UIHelper.horizontalSpaceSmall,
          Flexible(
            child: TextField(
              onChanged: (value){
                if(value.isNotEmpty){
                  setState(() {
                    showIcons = true;
                  });
                } else{
                   setState(() {
                    showIcons = false;
                  });

                }

              },
              controller: widget.chatController,
              decoration: InputDecoration(
                suffixIcon:  showIcons? IconButton(
                  onPressed: widget.onSendTap,
                  icon: SvgPicture.asset(Assets.icons.copyIcon),
                ) : const SizedBox.shrink() ,
                fillColor: AppColors.cF3F6F6,
                filled: true,
                hintText: "Write your message",
                hintStyle: TextFontStyle.headline16c333333tyleMontserratW500
                    .copyWith(color: AppColors.c979797, fontSize: 12.sp),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 12.h, horizontal: 15.w),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0.r),
                  borderSide: const BorderSide(
                    color: AppColors.cF3F6F6,
                    width: 1,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0.r),
                  borderSide: const BorderSide(
                    color: AppColors.cF3F6F6,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0.r),
                  borderSide: const BorderSide(
                    color: AppColors.cF3F6F6,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          UIHelper.horizontalSpace(16.h),
          if(showIcons) SvgPicture.asset(Assets.icons.sendIcon)
        ],
      ),
    );
  }
}

class CoversationAppBarWidget extends StatelessWidget {
  const CoversationAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
      child: Row(
        children: [
          InkWell(
              onTap: () => NavigationService.goBack,
              child: SvgPicture.asset(Assets.icons.backArrow)),
          UIHelper.horizontalSpace(25.h),
          Expanded(
            child: ChatHeader(
              title: "Jhon Abraham",
              lastMessage: "Active now",
              imageUrl: Assets.images.user2.path,
            ),
          ),
          SvgPicture.asset(Assets.icons.callIcon),
        ],
      ),
    );
  }
}

class ChatHeader extends StatelessWidget {
  final String title, lastMessage, imageUrl;
  const ChatHeader({
    super.key,
    required this.title,
    required this.lastMessage,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 44.h,
          width: 44.h,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(52.r),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              )),
        ),
        UIHelper.horizontalSpace(12.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.verticalSpace(20.h),
            Text(
              title,
              style: TextFontStyle.headline16c333333tyleMontserratW500.copyWith(
                  color: AppColors.c1E1E1E, fontSize: 16.sp, height: 0.08.h),
            ),
            UIHelper.verticalSpace(20.h),
            Text(
              lastMessage,
              style: TextFontStyle.headline16c333333tyleMontserratW400.copyWith(
                  color: AppColors.c797C7A, fontSize: 12.sp, height: 0.08.h),
            ),
          ],
        )
      ],
    );
  }
}
