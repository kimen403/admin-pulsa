import 'package:dartz/dartz.dart';
import 'package:panel_admin_pulsa/common/failure.dart';
import 'package:panel_admin_pulsa/domain/entities/transaksi.dart';
import 'package:panel_admin_pulsa/domain/repositories/transaksi_repository.dart';
import 'package:panel_admin_pulsa/presentation/pages/transaksi/transaksi_page.dart';

class GetAllTransaksi {
  // final MovieRepository repository;
  final TransaksiRepository repository;

  GetAllTransaksi(this.repository);
  // GetMovieDetail(this.repository);

  Future<Either<Failure, List<Transaksi>>> execute() {
    return repository.getAllTransaksi();
  }
}
