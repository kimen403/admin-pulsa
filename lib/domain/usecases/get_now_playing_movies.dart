import 'package:dartz/dartz.dart';
import 'package:panel_admin_pulsa/domain/entities/movie.dart';
import 'package:panel_admin_pulsa/domain/repositories/movie_repository.dart';
import 'package:panel_admin_pulsa/common/failure.dart';

class GetNowPlayingMovies {
  final MovieRepository repository;

  GetNowPlayingMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getNowPlayingMovies();
  }
}
