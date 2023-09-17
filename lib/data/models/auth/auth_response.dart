import 'dart:convert';

import 'package:panel_admin_pulsa/data/models/auth/auth_model.dart';

class AuthResponse {
  final String status;
  final AuthModel data;

  AuthResponse({
    required this.status,
    required this.data,
  });

  factory AuthResponse.fromRawJson(String str) =>
      AuthResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        status: json["status"],
        data: AuthModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}
