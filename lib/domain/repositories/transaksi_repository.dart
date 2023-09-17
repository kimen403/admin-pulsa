import 'package:dartz/dartz.dart';
import 'package:panel_admin_pulsa/common/failure.dart';
import 'package:panel_admin_pulsa/domain/entities/transaksi.dart';

abstract class TransaksiRepository {
  // Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Transaksi>>> getAllTransaksi();
}
