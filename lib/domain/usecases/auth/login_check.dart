import 'package:dartz/dartz.dart';

import 'package:panel_admin_pulsa/common/failure.dart';
import 'package:panel_admin_pulsa/data/models/auth/auth_model.dart';
import 'package:panel_admin_pulsa/domain/repositories/auth_repository.dart';

class LoginCheck {
  final AuthRepository repository;

  LoginCheck(this.repository);

  Future<Either<Failure, AuthModel>> execute() {
    return repository.loginCheck();
  }
}
