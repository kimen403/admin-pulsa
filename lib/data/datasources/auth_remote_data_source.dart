import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:panel_admin_pulsa/common/constants.dart';
import 'package:panel_admin_pulsa/common/exception.dart';
import 'package:panel_admin_pulsa/data/datasources/db/database_helper.dart';
import 'package:panel_admin_pulsa/data/models/auth/auth_model.dart';
import 'package:panel_admin_pulsa/data/models/auth/auth_response.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login(username, password);
  Future<AuthModel> register(username, password);
  Future<AuthModel> getAuth();
  Future<bool> logout(String rToken);
  // Future<OpenKasirResponse> openKasir(OpenKasirModel saldoAwal);
  // Future<CloseKasirResponse> closeKasir(CloseKasirModel data);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;
  final DatabaseHelper databaseHelper;
  AuthRemoteDataSourceImpl(
      {required this.client, required this.databaseHelper});

  @override
  Future<AuthModel> login(username, password) async {
    print('$BASE_URL/server/login');
    final response = await client.post(
      Uri.parse('$BASE_URL/login'),
      body: {
        'username': username,
        'password': password,
      },
    );
    print('statusCode LOGIN: ${response.statusCode.toString()}');
    print('body LOGIN: ${response.body}');
    if (response.statusCode == 201) {
      // print(AuthResponse.fromJson(json.decode(response.body)).data);
      return AuthResponse.fromJson(json.decode(response.body)).data;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AuthModel> register(username, password) async {
    final response = await client.post(
      Uri.parse('$BASE_URL/register'),
      body: {
        'username': username,
        'password': password,
      },
    );
    if (response.statusCode == 201) {
      return AuthResponse.fromJson(json.decode(response.body)).data;
    } else {
      throw ServerException();
    }
  }

  // untuk refresh token
  @override
  Future<AuthModel> getAuth() async {
    final response = await client.get(Uri.parse('$BASE_URL/auth'));
    if (response.statusCode == 200) {
      return AuthResponse.fromJson(json.decode(response.body)).data;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> logout(rToken) async {
    final token = await databaseHelper.getToken();
    final response = await client.post(
      Uri.parse('$BASE_URL/logout'),
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: {
        'refreshToken': rToken,
      },
    );
    print('statusCode LOGOUT: ${response.statusCode.toString()}');
    print('body LOGOUT: ${response.body}');
    if (response.statusCode == 200) {
      return true;
    } else {
      throw ServerException();
    }
  }

  // @override
  // Future<OpenKasirResponse> openKasir(OpenKasirModel saldoAwal) async {
  //   final token = await databaseHelper.getToken();
  //   final response = await client.post(
  //     Uri.parse('$BASE_URL/kasir/open'),
  //     headers: {
  //       'Authorization': 'Bearer $token',
  //       'Content-Type': 'application/json',
  //     },
  //     body: json.encode(saldoAwal.toJson()),
  //   );
  //   if (response.statusCode == 201) {
  //     return OpenKasirResponse.fromRawJson(response.body);
  //   } else {
  //     throw ServerException();
  //   }
  // }

  // @override
  // Future<CloseKasirResponse> closeKasir(CloseKasirModel data) async {
  //   final token = await databaseHelper.getToken();
  //   final response = await client.post(
  //     Uri.parse('$BASE_URL/kasir/close'),
  //     headers: {
  //       'Authorization': 'Bearer $token',
  //       'Content-Type': 'application/json',
  //     },
  //     body: json.encode(data.toJson()),
  //   );

  //   print('response ${response.body}');
  //   print('response ${response.statusCode}');
  //   if (response.statusCode == 201) {
  //     return CloseKasirResponse.fromRawJson(response.body);
  //   } else {
  //     throw ServerException();
  //   }
  // }
}
