import 'dart:convert';

class LoginResponseModel {
    bool? success;
    String? token;

    LoginResponseModel({
        this.success,
        this.token,
    });

    LoginResponseModel copyWith({
        bool? success,
        String? token,
    }) => 
        LoginResponseModel(
            success: success ?? this.success,
            token: token ?? this.token,
        );

    factory LoginResponseModel.fromRawJson(String str) => LoginResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        success: json["success"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "token": token,
    };
}
