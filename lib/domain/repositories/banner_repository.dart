import 'package:dartz/dartz.dart';
import 'package:panel_admin_pulsa/common/failure.dart';
import 'package:panel_admin_pulsa/domain/entities/banners.dart';

abstract class BannersRepository {
  Future<Either<Failure, List<Banners>>> getBanners();
  // Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
}
