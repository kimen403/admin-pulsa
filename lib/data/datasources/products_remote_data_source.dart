import 'package:http/http.dart' as http;
import 'package:panel_admin_pulsa/common/constants.dart';
import 'package:panel_admin_pulsa/common/exception.dart';
import 'package:panel_admin_pulsa/data/datasources/db/database_helper.dart';
import 'package:panel_admin_pulsa/data/models/auth/open_kasir_response.dart';
import 'package:panel_admin_pulsa/data/models/products/Response/ProductModel.dart';
import 'package:panel_admin_pulsa/data/models/products/Response/ResponseProducts.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  //NOTE step 1: isi dengan nama method yang akan dibuat (hanya untuk validasi)
  // Future<List<MovieModel>> getNowPlayingMovies();
  // Future<MovieDetailResponse> getMovieDetail(int id);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final http.Client client;
  final DatabaseHelper databaseHelper;

  ProductsRemoteDataSourceImpl(
      {required this.client, required this.databaseHelper});

  @override
  Future<List<ProductModel>> getProducts() async {
    final token = await databaseHelper.getToken();
    print('token: $token');
    final response = await client.get(
      Uri.parse('$BASE_URL/products'),
      headers: {'Authorization': 'Bearer $token'},
    );
    print('response: ${response.body}');
    if (response.statusCode == 200) {
      return ProductsResponse.fromRawJson(response.body).products;
    } else {
      throw ServerException(message: 'Failed to load products');
    }
  }
  // @override
  // Future<List<MovieModel>> getNowPlayingMovies() async {
  //   final response =
  //       await client.get(Uri.parse('BASE_URL/movie/now_playing?API_KEY'));

  //   if (response.statusCode == 200) {
  //     return MovieResponse.fromJson(json.decode(response.body)).movieList;
  //   } else {
  //     throw ServerException();
  //   }
  // }

  // @override
  // Future<MovieDetailResponse> getMovieDetail(int id) async {
  //   final response =
  //       await client.get(Uri.parse('BASE_URL/movie/id?API_KEY'));

  //   if (response.statusCode == 200) {
  //     return MovieDetailResponse.fromJson(json.decode(response.body));
  //   } else {
  //     throw ServerException();
  //   }
  // }
}
