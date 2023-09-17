import 'package:dartz/dartz.dart';
import 'package:panel_admin_pulsa/domain/entities/movie.dart';
import 'package:panel_admin_pulsa/domain/repositories/movie_repository.dart';
import 'package:panel_admin_pulsa/common/failure.dart';

class GetMovieRecommendations {
  final MovieRepository repository;

  GetMovieRecommendations(this.repository);

  Future<Either<Failure, List<Movie>>> execute(id) {
    return repository.getMovieRecommendations(id);
  }
}
