import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:poswell_app/features/question/model/survey_model.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/all_routes.dart';
import 'package:poswell_app/helpers/navigation_service.dart';
import 'package:poswell_app/networks/api_acess.dart';

import '../../../common_widget/auth_button.dart';
import '../../../common_widget/logo_widget.dart';
import '../../../helpers/ui_helpers.dart';

class QuestionScreen extends StatefulWidget {
  final int id;
  const QuestionScreen({super.key, required this.id});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<String?> selectedAnswers = [];
  List<List<bool>> isSelected = [];
  List<Map<String, int>> selectedAnswersList = [];
  String? result;

  @override
  void initState() {
    super.initState();
    getSurveyRxObj.getSurvey(widget.id);
  }

  void initializeSelectedAnswers(int questionCount, List<int> optionsCounts) {
    if (selectedAnswers.isEmpty) {
      selectedAnswers = List<String?>.filled(questionCount, null);
      isSelected = List.generate(
        questionCount,
        (questionIndex) =>
            List.generate(optionsCounts[questionIndex], (_) => false),
      );
      selectedAnswersList = []; // Initialize list
    }
  }

  // void printSelectedAnswers() {
  //   // Print the selected answers in the desired format
  //   StringBuffer buffer = StringBuffer();
  //   for (var answer in selectedAnswersList) {
  //     buffer.write("{\"question_id\": ${answer["question_id"]}, \"answer_id\": ${answer["answer_id"]} }, ");
  //   }

  //   result = buffer.toString();

  //   if (result!.length > 13) {
  //     result = result?.substring(0, result!.length - 2);
  //   }

  //   log("Selected Answers: $result");
  // }

  void printSelectedAnswers() {
    List<Map<String, int>> answers = selectedAnswersList.map((answer) {
      return {
        "question_id": answer["question_id"] ?? 0,
        "answer_id": answer["answer_id"] ?? 0,
      };
    }).toList();

    result = jsonEncode({"answers": answers}); // JSON encode the answers list
    log("Selected Answers JSON: $result");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Stack(
        children: [
          Column(
            children: [
              UIHelper.verticalSpace(45.h),
              const LogoWidget(),
              UIHelper.verticalSpace(16.h),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal: UIHelper.kDefaulutPadding()),
                  children: [
                    UIHelper.verticalSpace(16.h),
                    StreamBuilder(
                      stream: getSurveyRxObj.dataFetcher,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return const Center(child: Text("No survey found"));
                        } else if (snapshot.hasData) {
                          SurveyModel surveyModel = snapshot.data!;
                          final data = surveyModel.data ?? [];

                          // Initialize the selected answers and isSelected lists
                          initializeSelectedAnswers(
                            data.length,
                            data
                                .map(
                                    (question) => question.options?.length ?? 0)
                                .toList(),
                          );

                          return ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: data.length,
                            itemBuilder: (context, questionIndex) {
                              final survey = data[questionIndex];
                              return Container(
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: AppColors.cFFFFFF,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(22.r),
                                    bottomLeft: Radius.circular(22.r),
                                  ),
                                ),
                                padding: EdgeInsets.all(18.sp),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Q${questionIndex + 1}: ",
                                          style: TextFontStyle
                                              .headline16c666666tyleMontserratW700
                                              .copyWith(
                                            fontSize: 14.sp,
                                            color: AppColors.c1E1E1E,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "${survey.questions}",
                                            style: TextFontStyle
                                                .headline16c333333tyleMontserratW500
                                                .copyWith(
                                              fontSize: 14.sp,
                                              color: AppColors.c1E1E1E,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    UIHelper.verticalSpace(10.h),
                                    ListView.builder(
                                      itemCount: survey.options?.length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (context, optionIndex) {
                                        final questionOption =
                                            survey.options?[optionIndex];
                                        final isOptionSelected =
                                            isSelected[questionIndex]
                                                [optionIndex];

                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              // Deselect all options for the question
                                              isSelected[questionIndex] =
                                                  List.generate(
                                                isSelected[questionIndex]
                                                    .length,
                                                (_) => false,
                                              );
                                              // Set the selected option to true
                                              isSelected[questionIndex]
                                                  [optionIndex] = true;

                                              // Update selected answer
                                              selectedAnswers[questionIndex] =
                                                  questionOption.toString();

                                              // Update the selected answers list with the question ID and answer ID
                                              selectedAnswersList.removeWhere(
                                                  (answer) =>
                                                      answer["question_id"] ==
                                                      survey.id!);
                                              selectedAnswersList.add({
                                                "question_id": survey.id!,
                                                "answer_id": questionOption
                                                        ?.id ??
                                                    0, // Assuming `id` is a property of `questionOption`
                                              });
                                            });

                                            printSelectedAnswers(); // Print selected answers
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 38.h,
                                                width: double.maxFinite,
                                                decoration: BoxDecoration(
                                                  color: isOptionSelected
                                                      ? AppColors.cDBFFF2
                                                      : AppColors.cFFFFFF,
                                                  border: Border.all(
                                                    color: isOptionSelected
                                                        ? AppColors.c57AE8F
                                                        : AppColors.cE0E4EA,
                                                    width: 0.75,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          48.r),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 16.w,
                                                  vertical: 8.h,
                                                ),
                                                alignment: Alignment.centerLeft,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 5.h),
                                                child: Text(
                                                  "${questionOption?.options}",
                                                  style: TextFontStyle
                                                      .headline16c333333tyleMontserratW500
                                                      .copyWith(
                                                    color: AppColors.c344057,
                                                    fontSize: 14.sp,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                    UIHelper.verticalSpace(80.h),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
              child: AuthCustomeButton(
                onCallBack: () {
                  // String? survey = result;

                  // postSurveyRXobj.postSurvey(
                  //     id: widget.id, survey: survey != null ? [survey] : []);

                  postSurveyRXobj.postSurvey(
                    id: widget.id,
                    survey:
                        result != null ? jsonDecode(result!)["answers"] : [],
                  ).then((_){
                   NavigationService.navigateToWithArgs(Routes.scoreScreen,{
                    "id": widget.id
                   });
                  });
                },
                name: "Continue",
                height: 45.h,
                minWidth: double.maxFinite,
                borderRadius: 5.r,
                color: AppColors.allPrimaryColor,
                textStyle:
                    TextFontStyle.headline16c666666tyleMontserratW600.copyWith(
                  color: AppColors.cFFFFFF,
                ),
                context: context,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
