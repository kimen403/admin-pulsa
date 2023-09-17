import 'package:dartz/dartz.dart';
import 'package:panel_admin_pulsa/common/failure.dart';

import 'package:panel_admin_pulsa/domain/entities/product.dart';
// import 'package:ditonton/domain/entities/movie_detail.dart';
// import 'package:ditonton/domain/repositories/movie_repository.dart';

import 'package:panel_admin_pulsa/domain/repositories/products-repository.dart';

class GetAllProducts {
  // final MovieRepository repository;
  final ProductsRepository repository;

  GetAllProducts(this.repository);
  // GetMovieDetail(this.repository);

  Future<Either<Failure, List<Product>>> execute() {
    return repository.getProducts();
  }
  // Future<Either<Failure, MovieDetail>> execute(int id) {
  //   return repository.getMovieDetail(id);
  // }
}
