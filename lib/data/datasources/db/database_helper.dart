import 'dart:async';

import 'package:panel_admin_pulsa/common/cache_json.dart';
import 'package:panel_admin_pulsa/data/models/auth/auth_model.dart';

// import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  // static Database? _database;

  // Future<Database?> get database async {
  //   if (_database == null) {
  //     // _database = await _initDb();
  //   }
  //   return _database;
  // }

  static const String _tblWatchlist = 'watchlist';
  static const String _tblAuth = 'auth';

  // Future<Database> _initDb() async {
  //   final path = await getDatabasesPath();
  //   final databasePath = '$path/post.db';

  //   var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
  //   return db;
  // }

  // void _onCreate(Database db, int version) async {
  //   await db.execute(
  //       '''
  //   CREATE TABLE  $_tblWatchlist (
  //     id INTEGER PRIMARY KEY,
  //     title TEXT,
  //     overview TEXT,
  //     posterPath TEXT
  //   );
  // ''');
  //   await db.execute(
  //       '''
  //   CREATE TABLE  $_tblAuth (
  //     id TEXT ,
  //     role TEXT,
  //     username TEXT,
  //     fullname TEXT,---
  //     refreshToken TEXT,
  //     token TEXT
  //   );
  // ''');
  // }

  // Future<int> insertWatchlist(MovieTable movie) async {
  //   final db = await database;
  //   return await db!.insert(_tblWatchlist, movie.toJson());
  // }

  // Future<int> removeWatchlist(MovieTable movie) async {
  //   final db = await database;
  //   return await db!.delete(
  //     _tblWatchlist,
  //     where: 'id = ?',
  //     whereArgs: [movie.id],
  //   );
  // }

  // Future<Map<String, dynamic>?> getMovieById(int id) async {
  //   final db = await database;
  //   final results = await db!.query(
  //     _tblWatchlist,
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );

  //   if (results.isNotEmpty) {
  //     return results.first;
  //   } else {
  //     return null;
  //   }
  // }

  // Future<List<Map<String, dynamic>>> getWatchlistMovies() async {
  //   final db = await database;
  //   final List<Map<String, dynamic>> results = await db!.query(_tblWatchlist);

  //   return results;
  // }

  // Future<int> deleteAuth() async {
  //   final db = await database;
  //   final results = await db!.rawQuery('SELECT * FROM $_tblAuth');
  //   final result = await db.rawDelete('DELETE FROM $_tblAuth');
  //   print(results);
  //   return result;
  // }

  // Future<int> saveAuth(AuthModel auth) async {
  //   print(auth.toJson());
  //   final db = await database;
  //   final hasil = await db!.rawQuery('SELECT * FROM $_tblAuth');
  //   if (hasil.isNotEmpty) {
  //     print(hasil.first);
  //   }
  //   try {
  //     final result = await db.insert(_tblAuth, auth.toJson());
  //     return result;
  //   } catch (e) {
  //     print('error nih ' + e.toString());
  //     throw Exception(e.toString());
  //   }
  // }

  Future<String> getToken() async {
    final token = await JsonCache().getCache('auth');
    if (token != null && token != '') {
      final auth = AuthModel.fromJson(token);
      return auth.token;
    } else {
      return '';
    }
  }
}
