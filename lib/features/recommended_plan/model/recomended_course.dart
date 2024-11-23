import 'dart:convert';

class Recomendedcourse {
    bool? status;
    String? message;
    int? code;
    List<Datum>? data;

    Recomendedcourse({
        this.status,
        this.message,
        this.code,
        this.data,
    });

    Recomendedcourse copyWith({
        bool? status,
        String? message,
        int? code,
        List<Datum>? data,
    }) => 
        Recomendedcourse(
            status: status ?? this.status,
            message: message ?? this.message,
            code: code ?? this.code,
            data: data ?? this.data,
        );

    factory Recomendedcourse.fromRawJson(String str) => Recomendedcourse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Recomendedcourse.fromJson(Map<String, dynamic> json) => Recomendedcourse(
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
    int? userId;
    int? courseId;
    Course? course;

    Datum({
        this.id,
        this.userId,
        this.courseId,
        this.course,
    });

    Datum copyWith({
        int? id,
        int? userId,
        int? courseId,
        Course? course,
    }) => 
        Datum(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            courseId: courseId ?? this.courseId,
            course: course ?? this.course,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        courseId: json["course_id"],
        course: json["course"] == null ? null : Course.fromJson(json["course"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "course_id": courseId,
        "course": course?.toJson(),
    };
}

class Course {
    int? id;
    int? courseTypeId;
    String? name;
    String? imageUrl;
    int? modulesCount;

    Course({
        this.id,
        this.courseTypeId,
        this.name,
        this.imageUrl,
        this.modulesCount,
    });

    Course copyWith({
        int? id,
        int? courseTypeId,
        String? name,
        String? imageUrl,
        int? modulesCount,
    }) => 
        Course(
            id: id ?? this.id,
            courseTypeId: courseTypeId ?? this.courseTypeId,
            name: name ?? this.name,
            imageUrl: imageUrl ?? this.imageUrl,
            modulesCount: modulesCount ?? this.modulesCount,
        );

    factory Course.fromRawJson(String str) => Course.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Course.fromJson(Map<String, dynamic> json) => Course(
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
