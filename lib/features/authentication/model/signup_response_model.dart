import 'dart:convert';

class SignUpResponseModel {
    bool? success;
    String? message;
    String? token;

    SignUpResponseModel({
        this.success,
        this.message,
        this.token,
    });

    SignUpResponseModel copyWith({
        bool? success,
        String? message,
        String? token,
    }) => 
        SignUpResponseModel(
            success: success ?? this.success,
            message: message ?? this.message,
            token: token ?? this.token,
        );

    factory SignUpResponseModel.fromRawJson(String str) => SignUpResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SignUpResponseModel.fromJson(Map<String, dynamic> json) => SignUpResponseModel(
        success: json["success"],
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "token": token,
    };
}
