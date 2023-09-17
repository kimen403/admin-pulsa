import 'dart:convert';

class OpenKasirResponse {
  final String status;
  final Data data;

  OpenKasirResponse({
    required this.status,
    required this.data,
  });

  factory OpenKasirResponse.fromRawJson(String str) =>
      OpenKasirResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OpenKasirResponse.fromJson(Map<String, dynamic> json) =>
      OpenKasirResponse(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  final String id;
  final String status;

  Data({
    required this.id,
    required this.status,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
      };
}
