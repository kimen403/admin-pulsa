import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:panel_admin_pulsa/data/models/transaksi/transaksi_model.dart';

class TransaksiResponseModel {
  final String status;
  final List<HistoryTransaksiModel> historyTransaksi;

  TransaksiResponseModel({
    required this.status,
    required this.historyTransaksi,
  });

  factory TransaksiResponseModel.fromRawJson(String str) =>
      TransaksiResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TransaksiResponseModel.fromJson(Map<String, dynamic> json) =>
      TransaksiResponseModel(
        status: json["status"],
        historyTransaksi: List<HistoryTransaksiModel>.from(
            json["historyTransaksi"]
                .map((x) => HistoryTransaksiModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "historyTransaksi":
            List<dynamic>.from(historyTransaksi.map((x) => x.toJson())),
      };
}
