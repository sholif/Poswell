import 'dart:convert';

class CoursesArticleResponseModel {
    bool? status;
    String? message;
    int? code;
    Data? data;

    CoursesArticleResponseModel({
        this.status,
        this.message,
        this.code,
        this.data,
    });

    CoursesArticleResponseModel copyWith({
        bool? status,
        String? message,
        int? code,
        Data? data,
    }) => 
        CoursesArticleResponseModel(
            status: status ?? this.status,
            message: message ?? this.message,
            code: code ?? this.code,
            data: data ?? this.data,
        );

    factory CoursesArticleResponseModel.fromRawJson(String str) => CoursesArticleResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CoursesArticleResponseModel.fromJson(Map<String, dynamic> json) => CoursesArticleResponseModel(
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
    String? courseImage;
    List<Article>? articles;

    Data({
        this.courseImage,
        this.articles,
    });

    Data copyWith({
        String? courseImage,
        List<Article>? articles,
    }) => 
        Data(
            courseImage: courseImage ?? this.courseImage,
            articles: articles ?? this.articles,
        );

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        courseImage: json["course_image"],
        articles: json["articles"] == null ? [] : List<Article>.from(json["articles"]!.map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "course_image": courseImage,
        "articles": articles == null ? [] : List<dynamic>.from(articles!.map((x) => x.toJson())),
    };
}

class Article {
    int? id;
    int? courseId;
    String? imageUrl;
    String? title;
    String? description;
    int? mark;
    String? fileUrl;
    String? audioTime;

    Article({
        this.id,
        this.courseId,
        this.imageUrl,
        this.title,
        this.description,
        this.mark,
        this.fileUrl,
        this.audioTime,
    });

    Article copyWith({
        int? id,
        int? courseId,
        String? imageUrl,
        String? title,
        String? description,
        int? mark,
        String? fileUrl,
        String? audioTime,
    }) => 
        Article(
            id: id ?? this.id,
            courseId: courseId ?? this.courseId,
            imageUrl: imageUrl ?? this.imageUrl,
            title: title ?? this.title,
            description: description ?? this.description,
            mark: mark ?? this.mark,
            fileUrl: fileUrl ?? this.fileUrl,
            audioTime: audioTime ?? this.audioTime,
        );

    factory Article.fromRawJson(String str) => Article.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["id"],
        courseId: json["course_id"],
        imageUrl: json["image_url"],
        title: json["title"],
        description: json["description"],
        mark: json["mark"],
        fileUrl: json["file_url"],
        audioTime: json["audio_time"],
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
    };
}
