// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poswell_app/common_widget/custom_text_field_with_shadow.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/gen/assets.gen.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/all_routes.dart';
import 'package:poswell_app/helpers/navigation_service.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

import '../../../common_widget/auth_button.dart';

class AddReminderScreen extends StatefulWidget {
  const AddReminderScreen({super.key});

  @override
  State<AddReminderScreen> createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  final ValueNotifier<String> selectedTimeZone = ValueNotifier<String>("");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 250.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Assets.images.reminderScreenBg.path),
                        fit: BoxFit.cover)),
                padding: EdgeInsets.symmetric(
                    horizontal: UIHelper.kDefaulutPadding()),
                child: Column(
                  children: [
                    UIHelper.verticalSpace(60.h),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () => NavigationService.goBack,
                            child: SvgPicture.asset(
                              Assets.icons.backArrow,
                              color: AppColors.cFFFFFF,
                            )),
                        UIHelper.horizontalSpace(100.w),
                        Text(
                          "Add Reminder",
                          style: TextFontStyle
                              .headline16c666666tyleMontserratW600
                              .copyWith(
                                  color: AppColors.cFFFFFF, fontSize: 18.sp),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: 150.h.h,
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: AppColors.cFFFFFF,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    )),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal: UIHelper.kDefaulutPadding()),
                  children: [
                    UIHelper.verticalSpace(40.h),
                    CustomTextFieldWithShadow(
                      inputType: TextInputType.name,
                      title: "Headline",
                      hintText: "Good Morning",
                    ),
                    UIHelper.verticalSpace(18.h),
                    CustomTextFieldWithShadow(
                      inputType: TextInputType.name,
                      title: "Description",
                      hintText:
                          "Lorem ipsum dolor sit amet, consectetur piscing elit.",
                      maxline: 2,
                    ),
                    UIHelper.verticalSpace(18.h),
                    CustomTextFieldWithShadow(
                      inputType: TextInputType.name,
                      title: "Date",
                      hintText: "12 December 2023",
                      suffixIcon: InkWell(
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                    secondaryHeaderColor:
                                        AppColors.allPrimaryColor,
                                    primaryColor: AppColors.allPrimaryColor,
                                    colorScheme: const ColorScheme.light(
                                      primary: AppColors
                                          .allPrimaryColor, // Header background color
                                      onPrimary: AppColors
                                          .cFFFFFF, // Header text color
                                      surface: AppColors.cFFFFFF,
                                    ),
                                    dialogBackgroundColor:
                                        AppColors.allPrimaryColor,
                                  ),
                                  child: child!,
                                );
                              },
                            );
                            if (pickedDate != null) {
                              log("===> $pickedDate");
                            }
                          },
                          child: const Icon(Icons.calendar_month)),
                    ),
                    UIHelper.verticalSpace(20.h),
                    Text(
                      "Reminder",
                      style: TextFontStyle.headline16c666666tyleMontserratW600
                          .copyWith(color: AppColors.c1E1E1E),
                    ),
                    UIHelper.verticalSpace(10.h),
                    ValueListenableBuilder<String>(
                        valueListenable: selectedTimeZone,
                        builder: (context, selectedValue, child) {
                          return Row(
                            children: [
                              TimeInputWidget(
                                controller: TextEditingController(),
                              ),
                              UIHelper.horizontalSpace(28.h),
                              TimeButoon(
                                onTap: () {
                                  selectedTimeZone.value = "AM";
                                },
                                title: "AM",
                                selectedValue: selectedValue,
                              ),
                              UIHelper.horizontalSpace(24.h),
                              TimeButoon(
                                onTap: () {
                                  selectedTimeZone.value = "PM";
                                },
                                title: "PM",
                                selectedValue: selectedValue,
                              ),
                              // const TimeButoon(),
                            ],
                          );
                        })
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: UIHelper.kDefaulutPadding(), vertical: 10.h),
        child: AuthCustomeButton(
            onCallBack: () {
              NavigationService.navigateToReplacement(Routes.reminderSucessScreen);
            },
            name: "Save",
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

class TimeInputWidget extends StatelessWidget {
  final TextEditingController controller;
  const TimeInputWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: AppColors.cFFFFFF.withOpacity(0.7),
          filled: true,
          contentPadding:
              EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
          hintText: "10",
          hintStyle: TextFontStyle.headline16c333333tyleMontserratW500
              .copyWith(color: AppColors.cBEBEBE, fontSize: 14.sp),
          labelStyle: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.c637381,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0.r),
            borderSide: const BorderSide(
              color: AppColors.allPrimaryColor,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0.r),
            borderSide: const BorderSide(
              color: AppColors.allPrimaryColor,
              width: 1,
            ),
          ),
        ),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.c637381,
        ),
      ),
    );
  }
}

class TimeButoon extends StatelessWidget {
  final String title, selectedValue;
  final Function() onTap;
  const TimeButoon(
      {super.key,
      required this.title,
      required this.selectedValue,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 47.h,
        width: 52.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
                color: title == selectedValue
                    ? AppColors.allPrimaryColor
                    : AppColors.cAFAFAF)),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextFontStyle.headline16c333333tyleMontserratW400.copyWith(
              fontSize: 18.sp,
              color: title == selectedValue
                  ? AppColors.allPrimaryColor
                  : AppColors.cAFAFAF),
        ),
      ),
    );
  }
}
