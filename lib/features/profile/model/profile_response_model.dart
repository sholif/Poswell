import 'dart:convert';

class ProfileResponseModel {
    bool? status;
    String? message;
    int? code;
    Data? data;

    ProfileResponseModel({
        this.status,
        this.message,
        this.code,
        this.data,
    });

    ProfileResponseModel copyWith({
        bool? status,
        String? message,
        int? code,
        Data? data,
    }) => 
        ProfileResponseModel(
            status: status ?? this.status,
            message: message ?? this.message,
            code: code ?? this.code,
            data: data ?? this.data,
        );

    factory ProfileResponseModel.fromRawJson(String str) => ProfileResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProfileResponseModel.fromJson(Map<String, dynamic> json) => ProfileResponseModel(
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
    int? isSubscribed;
    String? firstName;
    String? lastName;
    String? email;
    String? avatar;
    String? address;

    Data({
        this.id,
        this.isSubscribed,
        this.firstName,
        this.lastName,
        this.email,
        this.avatar,
        this.address,
    });

    Data copyWith({
        int? id,
        int? isSubscribed,
        String? firstName,
        String? lastName,
        String? email,
        String? avatar,
        String? address,
    }) => 
        Data(
            id: id ?? this.id,
            isSubscribed: isSubscribed ?? this.isSubscribed,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            email: email ?? this.email,
            avatar: avatar ?? this.avatar,
            address: address ?? this.address,
        );

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        isSubscribed: json["is_subscribed"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        avatar: json["avatar"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "is_subscribed": isSubscribed,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "avatar": avatar,
        "address": address,
    };
}
