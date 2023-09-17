import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:panel_admin_pulsa/common/constants.dart';
import 'package:panel_admin_pulsa/data/datasources/db/database_helper.dart';
import 'package:panel_admin_pulsa/data/models/transaksi/transaksi_model.dart';
import 'package:panel_admin_pulsa/data/models/transaksi/transaksi_response_model.dart';
// import 'package:panel_admin_pulsa/domain/entities/transaksi.dart';

abstract class TransaksiRemoteDataSource {
  //NOTE step 1: isi dengan nama method yang akan dibuat (hanya untuk validasi)
  // Future<List<MovieModel>> getNowPlayingMovies();
  // Future<MovieDetailResponse> getMovieDetail(int id);
  Future<List<HistoryTransaksiModel>> getAllTransaksi();
}

class TransaksiRemoteDataSourceImpl implements TransaksiRemoteDataSource {
  final http.Client client;
  final DatabaseHelper databaseHelper;

  TransaksiRemoteDataSourceImpl(
      {required this.client, required this.databaseHelper});

  @override
  Future<List<HistoryTransaksiModel>> getAllTransaksi() async {
    final token = await databaseHelper.getToken();
    final response = await client.get(
      Uri.parse('$BASE_URL/history/transaksi'),
      headers: {'Authorization': 'Bearer $token'},
    );
    print('transaksi response: ${response.body}');
    print('transaksi response Code: ${response.statusCode}');
    if (response.statusCode == 200) {
      return TransaksiResponseModel.fromRawJson(response.body).historyTransaksi;
    } else {
      throw Exception('Failed to load transaksi');
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
