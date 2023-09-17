import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:panel_admin_pulsa/common/constants.dart';
import 'package:panel_admin_pulsa/data/models/banner/banner_model.dart';
import 'package:panel_admin_pulsa/data/models/banner/banner_model_reponse.dart';

abstract class BannersRemoteDataSource {
  Future<List<BannerModel>> getBanners();
  //NOTE step 1: isi dengan nama method yang akan dibuat (hanya untuk validasi)
  // Future<List<MovieModel>> getNowPlayingMovies();
  // Future<MovieDetailResponse> getMovieDetail(int id);
}

class BannersRemoteDataSourceImpl implements BannersRemoteDataSource {
  final http.Client client;

  BannersRemoteDataSourceImpl({required this.client});

  @override
  Future<List<BannerModel>> getBanners() async {
    final response = await client.get(Uri.parse('$BASE_URL/banner'));

    if (response.statusCode == 200) {
      return BannerResponseModel.fromJson(json.decode(response.body)).banner;
    } else {
      throw Exception();
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
