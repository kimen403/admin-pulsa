import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:panel_admin_pulsa/common/cache_json.dart';
import 'package:panel_admin_pulsa/common/exception.dart';
import 'package:panel_admin_pulsa/common/failure.dart';
import 'package:panel_admin_pulsa/data/datasources/auth_local_data_source.dart';
import 'package:panel_admin_pulsa/data/datasources/auth_remote_data_source.dart';
import 'package:panel_admin_pulsa/data/models/auth/auth_model.dart';
import 'package:panel_admin_pulsa/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final JsonCache jsonCache;

  AuthRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.jsonCache});

  @override
  Future<Either<Failure, AuthModel>> login(
      String username, String password) async {
    try {
      final result = await remoteDataSource.login(username, password);
      await localDataSource.saveAuth(result);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    final rToken = await localDataSource.getRefreshToken();
    try {
      final result = await remoteDataSource.logout(rToken);
      await localDataSource.deleteAuth();
      // await jsonCache.removeCache('list_pegawai');
      // await jsonCache.removeCache('list_product');
      // await jsonCache.removeCache('list_jasa');
      return Right(result);
    } on ServerException catch (e) {
      print(e.message);
      return Left(ServerFailure(e.message));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> loginCheck() async {
    try {
      final result = await localDataSource.loginCheck();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on CacheException {
      return Left(CacheFailure(''));
    }
  }
}
