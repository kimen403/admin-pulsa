import 'dart:convert';

class CloseKasirResponse {
  final String status;
  final Data data;

  CloseKasirResponse({
    required this.status,
    required this.data,
  });

  factory CloseKasirResponse.fromRawJson(String str) =>
      CloseKasirResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CloseKasirResponse.fromJson(Map<String, dynamic> json) =>
      CloseKasirResponse(
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
