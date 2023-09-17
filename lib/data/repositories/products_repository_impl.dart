import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:panel_admin_pulsa/common/exception.dart';
import 'package:panel_admin_pulsa/common/failure.dart';
import 'package:panel_admin_pulsa/data/datasources/products_remote_data_source.dart';
import 'package:panel_admin_pulsa/data/models/products/Response/ProductModel.dart';

import 'package:panel_admin_pulsa/domain/entities/product.dart';
import 'package:panel_admin_pulsa/domain/repositories/products-repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;
  // final ProductsLocalDataSource localDataSource;

  ProductsRepositoryImpl({
    required this.remoteDataSource,
    // required this.localDataSource,
  });

  //TODO: implementar method getProducts() dari abstract class ProductsRepository

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      List<ProductModel> result = await remoteDataSource.getProducts();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
