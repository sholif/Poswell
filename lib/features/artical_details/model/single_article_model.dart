import 'dart:convert';

class SingleArticleModel {
    bool? status;
    String? message;
    int? code;
    Data? data;

    SingleArticleModel({
        this.status,
        this.message,
        this.code,
        this.data,
    });

    SingleArticleModel copyWith({
        bool? status,
        String? message,
        int? code,
        Data? data,
    }) => 
        SingleArticleModel(
            status: status ?? this.status,
            message: message ?? this.message,
            code: code ?? this.code,
            data: data ?? this.data,
        );

    factory SingleArticleModel.fromRawJson(String str) => SingleArticleModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SingleArticleModel.fromJson(Map<String, dynamic> json) => SingleArticleModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    int? courseId;
    String? imageUrl;
    String? title;
    String? description;
    int? mark;
    String? fileUrl;
    String? audioTime;
    bool? isBookmarked;

    Data({
        this.id,
        this.courseId,
        this.imageUrl,
        this.title,
        this.description,
        this.mark,
        this.fileUrl,
        this.audioTime,
        this.isBookmarked,
    });

    Data copyWith({
        int? id,
        int? courseId,
        String? imageUrl,
        String? title,
        String? description,
        int? mark,
        String? fileUrl,
        String? audioTime,
        bool? isBookmarked,
    }) => 
        Data(
            id: id ?? this.id,
            courseId: courseId ?? this.courseId,
            imageUrl: imageUrl ?? this.imageUrl,
            title: title ?? this.title,
            description: description ?? this.description,
            mark: mark ?? this.mark,
            fileUrl: fileUrl ?? this.fileUrl,
            audioTime: audioTime ?? this.audioTime,
            isBookmarked: isBookmarked ?? this.isBookmarked,
        );

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        courseId: json["course_id"],
        imageUrl: json["image_url"],
        title: json["title"],
        description: json["description"],
        mark: json["mark"],
        fileUrl: json["file_url"],
        audioTime: json["audio_time"],
        isBookmarked: json["is_bookmarked"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "course_id": courseId,
        "image_url": imageUrl,
        "title": title,
        "description": description,
        "mark": mark,
        "file_url": fileUrl,
        "audio_time": audioTime,
        "is_bookmarked": isBookmarked,
    };
}
