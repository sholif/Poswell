import 'dart:convert';

class DailyReadArticleResponseModel {
    bool? status;
    String? message;
    int? code;
    List<Datum>? data;

    DailyReadArticleResponseModel({
        this.status,
        this.message,
        this.code,
        this.data,
    });

    DailyReadArticleResponseModel copyWith({
        bool? status,
        String? message,
        int? code,
        List<Datum>? data,
    }) => 
        DailyReadArticleResponseModel(
            status: status ?? this.status,
            message: message ?? this.message,
            code: code ?? this.code,
            data: data ?? this.data,
        );

    factory DailyReadArticleResponseModel.fromRawJson(String str) => DailyReadArticleResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DailyReadArticleResponseModel.fromJson(Map<String, dynamic> json) => DailyReadArticleResponseModel(
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
    String? imageUrl;
    String? title;
    String? description;

    Datum({
        this.id,
        this.courseId,
        this.imageUrl,
        this.title,
        this.description,
    });

    Datum copyWith({
        int? id,
        int? courseId,
        String? imageUrl,
        String? title,
        String? description,
    }) => 
        Datum(
            id: id ?? this.id,
            courseId: courseId ?? this.courseId,
            imageUrl: imageUrl ?? this.imageUrl,
            title: title ?? this.title,
            description: description ?? this.description,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        courseId: json["course_id"],
        imageUrl: json["image_url"],
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "course_id": courseId,
        "image_url": imageUrl,
        "title": title,
        "description": description,
    };
}
