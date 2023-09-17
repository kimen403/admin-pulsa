import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:panel_admin_pulsa/common/failure.dart';
import 'package:panel_admin_pulsa/data/datasources/banners_remote_data_source.dart';
import 'package:panel_admin_pulsa/domain/entities/banners.dart';
import 'package:panel_admin_pulsa/domain/repositories/banner_repository.dart';

class BannersRepositoryImpl implements BannersRepository {
  final BannersRemoteDataSource remoteDataSource;
  // final ProductsLocalDataSource localDataSource;

  BannersRepositoryImpl({
    required this.remoteDataSource,
    // required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Banners>>> getBanners() async {
    try {
      final banners = await remoteDataSource.getBanners();
      return Right(banners.map((e) => e.toEntity()).toList());
    } on SocketException {
      return Left(ServerFailure('Failed to connect to the network'));
    } on Exception {
      return Left(ServerFailure('Failed to connect to the network'));
    }
  }
  //TODO: implementar
  // @override
  // Future<Either<Failure, List<Product>>> getProducts() async {
  //
}
