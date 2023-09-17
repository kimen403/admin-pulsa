import 'dart:convert';

class CloseKasirModel {
  String? idKasir;
  final int saldoAkhir;
  final String keterangan;

  CloseKasirModel({
    this.idKasir,
    required this.saldoAkhir,
    required this.keterangan,
  });

  factory CloseKasirModel.fromRawJson(String str) =>
      CloseKasirModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CloseKasirModel.fromJson(Map<String, dynamic> json) =>
      CloseKasirModel(
        idKasir: json["idKasir"],
        saldoAkhir: json["saldoAkhir"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "idKasir": idKasir,
        "saldoAkhir": saldoAkhir,
        "keterangan": keterangan,
      };
}
