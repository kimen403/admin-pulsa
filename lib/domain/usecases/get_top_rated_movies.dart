import 'package:dartz/dartz.dart';
import 'package:panel_admin_pulsa/common/failure.dart';
import 'package:panel_admin_pulsa/domain/entities/movie.dart';
import 'package:panel_admin_pulsa/domain/repositories/movie_repository.dart';

class GetTopRatedMovies {
  final MovieRepository repository;

  GetTopRatedMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getTopRatedMovies();
  }
}
