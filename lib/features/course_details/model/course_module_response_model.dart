import 'dart:convert';

class CoursesModuleResponseModel {
    bool? status;
    String? message;
    int? code;
    Data? data;

    CoursesModuleResponseModel({
        this.status,
        this.message,
        this.code,
        this.data,
    });

    CoursesModuleResponseModel copyWith({
        bool? status,
        String? message,
        int? code,
        Data? data,
    }) => 
        CoursesModuleResponseModel(
            status: status ?? this.status,
            message: message ?? this.message,
            code: code ?? this.code,
            data: data ?? this.data,
        );

    factory CoursesModuleResponseModel.fromRawJson(String str) => CoursesModuleResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CoursesModuleResponseModel.fromJson(Map<String, dynamic> json) => CoursesModuleResponseModel(
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
    List<Module>? modules;

    Data({
        this.courseImage,
        this.modules,
    });

    Data copyWith({
        String? courseImage,
        List<Module>? modules,
    }) => 
        Data(
            courseImage: courseImage ?? this.courseImage,
            modules: modules ?? this.modules,
        );

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        courseImage: json["course_image"],
        modules: json["modules"] == null ? [] : List<Module>.from(json["modules"]!.map((x) => Module.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "course_image": courseImage,
        "modules": modules == null ? [] : List<dynamic>.from(modules!.map((x) => x.toJson())),
    };
}

class Module {
    int? id;
    int? courseId;
    String? title;
    String? content;
    int? isExam;
    String? question;
    int? mark;
    String? fileUrl;
    String? audioTime;
    String? access;

    Module({
        this.id,
        this.courseId,
        this.title,
        this.content,
        this.isExam,
        this.question,
        this.mark,
        this.fileUrl,
        this.audioTime,
        this.access,
    });

    Module copyWith({
        int? id,
        int? courseId,
        String? title,
        String? content,
        int? isExam,
        String? question,
        int? mark,
        String? fileUrl,
        String? audioTime,
        String? access,
    }) => 
        Module(
            id: id ?? this.id,
            courseId: courseId ?? this.courseId,
            title: title ?? this.title,
            content: content ?? this.content,
            isExam: isExam ?? this.isExam,
            question: question ?? this.question,
            mark: mark ?? this.mark,
            fileUrl: fileUrl ?? this.fileUrl,
            audioTime: audioTime ?? this.audioTime,
            access: access ?? this.access,
        );

    factory Module.fromRawJson(String str) => Module.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Module.fromJson(Map<String, dynamic> json) => Module(
        id: json["id"],
        courseId: json["course_id"],
        title: json["title"],
        content: json["content"],
        isExam: json["is_exam"],
        question: json["question"],
        mark: json["mark"],
        fileUrl: json["file_url"],
        audioTime: json["audio_time"],
        access: json["access"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "course_id": courseId,
        "title": title,
        "content": content,
        "is_exam": isExam,
        "question": question,
        "mark": mark,
        "file_url": fileUrl,
        "audio_time": audioTime,
        "access": access,
    };
}
