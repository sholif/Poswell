import 'dart:convert';

class GetCourseType {
    bool? status;
    String? message;
    int? code;
    List<Datum>? data;

    GetCourseType({
        this.status,
        this.message,
        this.code,
        this.data,
    });

    GetCourseType copyWith({
        bool? status,
        String? message,
        int? code,
        List<Datum>? data,
    }) => 
        GetCourseType(
            status: status ?? this.status,
            message: message ?? this.message,
            code: code ?? this.code,
            data: data ?? this.data,
        );

    factory GetCourseType.fromRawJson(String str) => GetCourseType.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetCourseType.fromJson(Map<String, dynamic> json) => GetCourseType(
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
    String? name;
    String? image;

    Datum({
        this.id,
        this.name,
        this.image,
    });

    Datum copyWith({
        int? id,
        String? name,
        String? image,
    }) => 
        Datum(
            id: id ?? this.id,
            name: name ?? this.name,
            image: image ?? this.image,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
    };
}
