import 'dart:convert';

class SurveyModel {
    bool? status;
    String? message;
    int? code;
    List<Datum>? data;

    SurveyModel({
        this.status,
        this.message,
        this.code,
        this.data,
    });

    SurveyModel copyWith({
        bool? status,
        String? message,
        int? code,
        List<Datum>? data,
    }) => 
        SurveyModel(
            status: status ?? this.status,
            message: message ?? this.message,
            code: code ?? this.code,
            data: data ?? this.data,
        );

    factory SurveyModel.fromRawJson(String str) => SurveyModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SurveyModel.fromJson(Map<String, dynamic> json) => SurveyModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    int? courseId;
    String? questions;
    List<Option>? options;

    Datum({
        this.id,
        this.courseId,
        this.questions,
        this.options,
    });

    Datum copyWith({
        int? id,
        int? courseId,
        String? questions,
        List<Option>? options,
    }) => 
        Datum(
            id: id ?? this.id,
            courseId: courseId ?? this.courseId,
            questions: questions ?? this.questions,
            options: options ?? this.options,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        courseId: json["course_id"],
        questions: json["questions"],
        options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "course_id": courseId,
        "questions": questions,
        "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x.toJson())),
    };
}

class Option {
    int? id;
    int? survayQuestionId;
    String? options;
    bool? isCorrect;

    Option({
        this.id,
        this.survayQuestionId,
        this.options,
        this.isCorrect,
    });

    Option copyWith({
        int? id,
        int? survayQuestionId,
        String? options,
        bool? isCorrect,
    }) => 
        Option(
            id: id ?? this.id,
            survayQuestionId: survayQuestionId ?? this.survayQuestionId,
            options: options ?? this.options,
            isCorrect: isCorrect ?? this.isCorrect,
        );

    factory Option.fromRawJson(String str) => Option.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        survayQuestionId: json["survay_question_id"],
        options: json["options"],
        isCorrect: json["is_correct"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "survay_question_id": survayQuestionId,
        "options": options,
        "is_correct": isCorrect,
    };
}
