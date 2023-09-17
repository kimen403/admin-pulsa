// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Transaksi extends Equatable {
  final String idUser;
  final String idTransaksi;
  final String tanggal;
  final String csWa;
  final String csTelegram;
  final String keterangan;
  final String sku;
  final String rc;
  final String sn;
  final String status;

  Transaksi(
      {required this.idUser,
      required this.idTransaksi,
      required this.tanggal,
      required this.csWa,
      required this.csTelegram,
      required this.keterangan,
      required this.sku,
      required this.rc,
      required this.sn,
      required this.status});

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
