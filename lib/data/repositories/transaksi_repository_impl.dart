import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:panel_admin_pulsa/common/exception.dart';
import 'package:panel_admin_pulsa/common/failure.dart';
import 'package:panel_admin_pulsa/data/datasources/transaksi_remote_data_source.dart';
import 'package:panel_admin_pulsa/domain/entities/transaksi.dart';
import 'package:panel_admin_pulsa/domain/repositories/transaksi_repository.dart';

class TransaksiRepositoryImpl implements TransaksiRepository {
  final TransaksiRemoteDataSource remoteDataSource;
  // final ProductsLocalDataSource localDataSource;

  TransaksiRepositoryImpl({
    required this.remoteDataSource,
    // required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Transaksi>>> getAllTransaksi() async {
    // TODO: implement getAllTransaksi
    try {
      final result = await remoteDataSource.getAllTransaksi();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
