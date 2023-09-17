import 'package:dartz/dartz.dart';

import 'package:panel_admin_pulsa/common/failure.dart';
import 'package:panel_admin_pulsa/data/models/auth/auth_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthModel>> login(String username, String password);
  // Future<Either<Failure, AuthModel>> register(String username, String password);
  Future<Either<Failure, bool>> logout();
  Future<Either<Failure, AuthModel>> loginCheck();
  // Future<Either<Failure, OpenKasirResponse>> openKasir(
  // OpenKasirModel saldoAwal);
  // Future<Either<Failure, CloseKasirResponse>> closeKasir(data);
}
