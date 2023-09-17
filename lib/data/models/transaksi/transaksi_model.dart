import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:panel_admin_pulsa/domain/entities/transaksi.dart';

class HistoryTransaksiModel extends Equatable {
  final String idUser;
  final String idTransaksi;
  final String tanggal;
  final String csWa;
  final String? csTelegram;
  final String keterangan;
  final String sku;
  final String rc;
  final String? sn;
  final String status;

  HistoryTransaksiModel({
    required this.idUser,
    required this.idTransaksi,
    required this.tanggal,
    required this.csWa,
    required this.csTelegram,
    required this.keterangan,
    required this.sku,
    required this.rc,
    this.sn,
    required this.status,
  });

  factory HistoryTransaksiModel.fromRawJson(String str) =>
      HistoryTransaksiModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryTransaksiModel.fromJson(Map<String, dynamic> json) =>
      HistoryTransaksiModel(
        idUser: json["idUser"],
        idTransaksi: json["idTransaksi"],
        tanggal: json["tanggal"],
        csWa: json["csWa"],
        csTelegram: json["csTelegram"],
        keterangan: json["keterangan"],
        sku: json["sku"],
        rc: json["rc"],
        sn: json["sn"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "idTransaksi": idTransaksi,
        "tanggal": tanggal,
        "csWa": csWa,
        "csTelegram": csTelegram,
        "keterangan": keterangan,
        "sku": sku,
        "rc": rc,
        "sn": sn,
        "status": status,
      };

  Transaksi toEntity() {
    return Transaksi(
      idUser: this.idUser,
      idTransaksi: this.idTransaksi,
      tanggal: this.tanggal,
      csWa: this.csWa,
      csTelegram: this.csTelegram ?? '',
      keterangan: this.keterangan,
      sku: this.sku,
      rc: this.rc,
      sn: this.sn ?? '',
      status: this.status,
    );
  }

  @override
  List<Object?> get props => [
        idUser,
        idTransaksi,
        tanggal,
        csWa,
        csTelegram,
        keterangan,
        sku,
        rc,
        sn,
        status,
      ];
}
