import 'package:dartz/dartz.dart';

import 'package:panel_admin_pulsa/common/failure.dart';
import 'package:panel_admin_pulsa/domain/entities/product.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<Product>>> getProducts();

  // Future<Either<Failure, List<Product>>> getProductsByCategory(String category);
}
