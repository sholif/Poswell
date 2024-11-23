import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';

import '../gen/colors.gen.dart';

// ignore: must_be_immutable
final class CustomFormField extends StatelessWidget {
  String? hintText;
  final String? labelText;
  TextEditingController? textEditingController;
  final TextInputType inputType;
  double? fieldHeight;
  int? maxline;
  final String? Function(String?)? validator;
  bool? validation;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  bool isObsecure;
  bool isPass;
  FocusNode? focusNode;
  TextInputAction? textInputAction;
  Function(String)? onFieldSubmitted;
  Function(String)? onChanged;
  List<TextInputFormatter>? inputFormatters;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final bool? isEnabled;
  final double? cursorHeight;
  final Color? disableColor;
  final double? maxHeight, titleSpace;
  final double? prefixPadding;
  final String title;

  CustomFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.textEditingController,
    required this.inputType,
    this.fieldHeight,
    this.maxline,
    this.validator,
    this.validation = false,
    this.suffixIcon,
    this.prefixIcon,
    this.isObsecure = false,
    this.isPass = false,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.onChanged,
    this.inputFormatters,
    this.labelStyle,
    this.isEnabled,
    this.style,
    this.cursorHeight,
    this.disableColor,
    this.maxHeight,
    this.prefixPadding,
    this.titleSpace,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: maxHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextFontStyle.headline16c333333tyleMontserratW500.copyWith(
              color: AppColors.c2C2C2E, fontSize: 14.sp
            ),
          ),
          titleSpace !=null? UIHelper.verticalSpace(titleSpace!): UIHelper.verticalSpace(8.h),
          TextFormField(
            cursorHeight: cursorHeight ?? 20.h,
            cursorColor: AppColors.c637381, 
            focusNode: focusNode,
            obscureText: isPass ? isObsecure : false,
            textInputAction: textInputAction,
            autovalidateMode:
                validation! ? AutovalidateMode.always : AutovalidateMode.disabled,
            validator: validator,
            maxLines: maxline ?? 1,
            controller: textEditingController,
            onFieldSubmitted: onFieldSubmitted,
            onChanged: onChanged,
            inputFormatters: inputFormatters,
            enabled: isEnabled,
            decoration: InputDecoration(
              
              suffixIcon: Padding(
                padding:  EdgeInsets.only(right: 10.w),
                child: suffixIcon,
              ),
              suffixIconConstraints: BoxConstraints(
                   maxWidth: 32.w,
                 maxHeight: 32.w,
                 minHeight: 32.w,
                 minWidth: 32.w,
              ),
              prefixIcon: prefixIcon,
              prefixIconConstraints: BoxConstraints(
                maxWidth: 40.w,
                 maxHeight: 40.w,
                 minHeight: 40.w,
                 minWidth: 40.w,
                 ),
                 
              fillColor: AppColors.cFFFFFF.withOpacity(0.7),
              filled: true,
              contentPadding:  EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w), 
              hintText: hintText,
              hintStyle:  TextFontStyle.headline16c333333tyleMontserratW500.copyWith(
                color: AppColors.cBEBEBE, fontSize: 14.sp
              ),
              labelText: labelText,
              labelStyle: labelStyle ??
                  TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.c637381,
                  ),
              errorStyle: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: Colors.red,
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0.r),
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0.r),
                borderSide: const BorderSide(
                  color: AppColors.cED459A,
                  width: 1.5,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0.r),
                borderSide: BorderSide(
                  color: disableColor ?? AppColors.c637381.withOpacity(0.6),
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0.r),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0.r),
                borderSide: const BorderSide(
                  color: AppColors.cE2DDDB,
                  width: 1,
                ),
              ),
            ),
            style: style ??
                TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.c637381,
                ),
            keyboardType: inputType,
          ),
        ],
      ),
    );
  }
}
