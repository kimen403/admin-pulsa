import 'package:dartz/dartz.dart';

import 'package:panel_admin_pulsa/common/failure.dart';
import 'package:panel_admin_pulsa/data/models/auth/auth_model.dart';
import 'package:panel_admin_pulsa/domain/repositories/auth_repository.dart';

class PostLogin {
  final AuthRepository repository;

  PostLogin(this.repository);

  Future<Either<Failure, AuthModel>> execute(
      String username, String password) async {
    final result = await repository.login(username, password);

    if (result.isRight()) {
      print('RESULT IS RIGHT${result.isRight()}');
      print('RESULT IS RIGHT${result.isRight()}');
    } else {
      print('RESULT IS LEFT${result.isLeft()}');
      print('RESULT IS LEFT${result.isLeft()}');
    }
    // result.fold(
    //   (fail) => print(fail.message),
    //   (data) => print('data TOKEN${data.token}'),
    // );
    return result;
  }
}
