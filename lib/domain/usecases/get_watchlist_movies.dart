import 'package:dartz/dartz.dart';
import 'package:panel_admin_pulsa/domain/entities/movie.dart';
import 'package:panel_admin_pulsa/domain/repositories/movie_repository.dart';
import 'package:panel_admin_pulsa/common/failure.dart';

class GetWatchlistMovies {
  final MovieRepository _repository;

  GetWatchlistMovies(this._repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return _repository.getWatchlistMovies();
  }
}
