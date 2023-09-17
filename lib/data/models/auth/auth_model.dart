import 'package:equatable/equatable.dart';
import 'dart:convert';

class AuthModel extends Equatable {
  final String token;
  final String refreshToken;
  final String fullname;

  AuthModel({
    required this.token,
    required this.refreshToken,
    required this.fullname,
  });

  factory AuthModel.fromRawJson(String str) =>
      AuthModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        token: json["token"],
        refreshToken: json["refreshToken"],
        fullname: json["fullname"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "refreshToken": refreshToken,
        "fullname": fullname,
      };

  @override
  List<Object> get props => [
        token,
        refreshToken,
        fullname,
      ];
}
