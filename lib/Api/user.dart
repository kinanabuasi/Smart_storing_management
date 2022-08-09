// To parse this JSON data, do
//
//     final userDecoder = userDecoderFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class UserDecoder {
  UserDecoder({
    required this.data,
    required this.message,
    required this.code,
  });

  UserData data;
  String message;
  int code;

  factory UserDecoder.fromJson(String str) => UserDecoder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDecoder.fromMap(Map<String, dynamic> json) => UserDecoder(
    data: UserData.fromMap(json["data"]),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toMap() => {
    "data": data.toMap(),
    "message": message,
    "code": code,
  };
}

class UserData {
  UserData({
    required this.success,
    required this.user,
    required this.token,
  });

  bool success;
  User user;
  String token;

  factory UserData.fromJson(String str) => UserData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
    success: json["success"],
    user:  json["user"]==null?User.fromMap(json["customer"]):User.fromMap(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "user": user.toMap(),
    "token": token,
  };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.roleId,
    required this.roleName,
  });

  int id;
  String name;
  String email;
  int roleId;
  String roleName;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    roleId: json["role_id"],
    roleName: json["role_name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "email": email,
    "role_id": roleId,
    "role_name": roleName,
  };
}
