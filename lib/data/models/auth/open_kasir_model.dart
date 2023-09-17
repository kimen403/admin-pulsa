import 'package:meta/meta.dart';
import 'dart:convert';

class OpenKasirModel {
  final int saldoAwal;

  OpenKasirModel({
    required this.saldoAwal,
  });

  factory OpenKasirModel.fromRawJson(String str) =>
      OpenKasirModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OpenKasirModel.fromJson(Map<String, dynamic> json) => OpenKasirModel(
        saldoAwal: json["saldoAwal"],
      );

  Map<String, dynamic> toJson() => {
        "saldoAwal": saldoAwal,
      };
}
