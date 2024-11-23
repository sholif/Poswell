import 'dart:convert';

class AllCoursesResponseModel {
    bool? status;
    String? message;
    int? code;
    List<Datum>? data;

    AllCoursesResponseModel({
        this.status,
        this.message,
        this.code,
        this.data,
    });

    AllCoursesResponseModel copyWith({
        bool? status,
        String? message,
        int? code,
        List<Datum>? data,
    }) => 
        AllCoursesResponseModel(
            status: status ?? this.status,
            message: message ?? this.message,
            code: code ?? this.code,
            data: data ?? this.data,
        );

    factory AllCoursesResponseModel.fromRawJson(String str) => AllCoursesResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AllCoursesResponseModel.fromJson(Map<String, dynamic> json) => AllCoursesResponseModel(
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
    int? courseTypeId;
    String? name;
    String? imageUrl;
    int? modulesCount;

    Datum({
        this.id,
        this.courseTypeId,
        this.name,
        this.imageUrl,
        this.modulesCount,
    });

    Datum copyWith({
        int? id,
        int? courseTypeId,
        String? name,
        String? imageUrl,
        int? modulesCount,
    }) => 
        Datum(
            id: id ?? this.id,
            courseTypeId: courseTypeId ?? this.courseTypeId,
            name: name ?? this.name,
            imageUrl: imageUrl ?? this.imageUrl,
            modulesCount: modulesCount ?? this.modulesCount,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        courseTypeId: json["course_type_id"],
        name: json["name"],
        imageUrl: json["image_url"],
        modulesCount: json["modules_count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "course_type_id": courseTypeId,
        "name": name,
        "image_url": imageUrl,
        "modules_count": modulesCount,
    };
}
