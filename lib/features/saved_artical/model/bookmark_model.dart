import 'dart:convert';

class BookmarkModel {
    bool? status;
    String? message;
    int? code;
    List<Datum>? data;

    BookmarkModel({
        this.status,
        this.message,
        this.code,
        this.data,
    });

    BookmarkModel copyWith({
        bool? status,
        String? message,
        int? code,
        List<Datum>? data,
    }) => 
        BookmarkModel(
            status: status ?? this.status,
            message: message ?? this.message,
            code: code ?? this.code,
            data: data ?? this.data,
        );

    factory BookmarkModel.fromRawJson(String str) => BookmarkModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BookmarkModel.fromJson(Map<String, dynamic> json) => BookmarkModel(
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
    String? title;
    String? imageUrl;
    String? description;

    Datum({
        this.id,
        this.title,
        this.imageUrl,
        this.description,
    });

    Datum copyWith({
        int? id,
        String? title,
        String? imageUrl,
        String? description,
    }) => 
        Datum(
            id: id ?? this.id,
            title: title ?? this.title,
            imageUrl: imageUrl ?? this.imageUrl,
            description: description ?? this.description,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        imageUrl: json["image_url"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image_url": imageUrl,
        "description": description,
    };
}
