// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  String message;
  List<User> user;

  UserResponse({
    required this.message,
    required this.user,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        message: json["message"],
        user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": List<dynamic>.from(user.map((x) => x.toJson())),
      };
}

class User {
  String userId;
  String userName;
  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNumber;
  DateTime createdBy;

  User({
    required this.userId,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.createdBy,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userId"],
        userName: json["userName"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        createdBy: DateTime.parse(json["createdBy"]),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userName": userName,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
        "createdBy": createdBy.toIso8601String(),
      };
}
