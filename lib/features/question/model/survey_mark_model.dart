import 'dart:convert';

class SurveyMarkModel {
    bool? status;
    String? message;
    int? code;
    List<Datum>? data;

    SurveyMarkModel({
        this.status,
        this.message,
        this.code,
        this.data,
    });

    SurveyMarkModel copyWith({
        bool? status,
        String? message,
        int? code,
        List<Datum>? data,
    }) => 
        SurveyMarkModel(
            status: status ?? this.status,
            message: message ?? this.message,
            code: code ?? this.code,
            data: data ?? this.data,
        );

    factory SurveyMarkModel.fromRawJson(String str) => SurveyMarkModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SurveyMarkModel.fromJson(Map<String, dynamic> json) => SurveyMarkModel(
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
    String? courseName;
    int? mark;

    Datum({
        this.courseName,
        this.mark,
    });

    Datum copyWith({
        String? courseName,
        int? mark,
    }) => 
        Datum(
            courseName: courseName ?? this.courseName,
            mark: mark ?? this.mark,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        courseName: json["course_name"],
        mark: json["mark"],
    );

    Map<String, dynamic> toJson() => {
        "course_name": courseName,
        "mark": mark,
    };
}
