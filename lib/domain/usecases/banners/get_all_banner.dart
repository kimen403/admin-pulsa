import 'package:dartz/dartz.dart';
import 'package:panel_admin_pulsa/common/failure.dart';
import 'package:panel_admin_pulsa/domain/entities/banners.dart';
import 'package:panel_admin_pulsa/domain/repositories/banner_repository.dart';

class GetAllBanner {
  // final MovieRepository repository;
  final BannersRepository repository;

  GetAllBanner(this.repository);
  // GetMovieDetail(this.repository);

  Future<Either<Failure, List<Banners>>> execute() {
    return repository.getBanners();
  }
}
