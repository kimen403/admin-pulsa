import 'package:dartz/dartz.dart';

import 'package:panel_admin_pulsa/common/failure.dart';
import 'package:panel_admin_pulsa/domain/repositories/auth_repository.dart';

class PostLogout {
  final AuthRepository repository;

  PostLogout(this.repository);

  Future<Either<Failure, bool>> execute() async {
    final result = await repository.logout();
    return result;
  }
}
