import 'package:flutter/material.dart';
import 'package:panel_admin_pulsa/common/state_enum.dart';
import 'package:panel_admin_pulsa/domain/entities/transaksi.dart';
import 'package:panel_admin_pulsa/domain/usecases/transaksi/get_all_transaksi.dart';

class TransaksiNotifier extends ChangeNotifier {
  // NOTE: DATA
  var _transaksiHistory = <Transaksi>[];
  List<Transaksi> get transaksiHistory => _transaksiHistory;

  // NOTE - STATE MANAGEMENT
  RequestState _historyTransaksiState = RequestState.Empty;
  RequestState get historyTransaksiState => _historyTransaksiState;

  // NOTE - MESSAGE
  String _message = '';
  String get message => _message;

  // NOTE - CONSTRUCTOR
  TransaksiNotifier({
    //   // required this.getNowPlayingMovies,
    //   // required this.getPopularMovies,
    //   // required this.getTopRatedMovies,
    required this.getAllTransaksi,
  });

  // NOTE - FUNCTION

  // final GetNowPlayingMovies getNowPlayingMovies;
  // final GetPopularMovies getPopularMovies;
  // final GetTopRatedMovies getTopRatedMovies;
  final GetAllTransaksi getAllTransaksi;

  // NOTE - FUNCTION
  Future<void> fetchTransaksiHistory() async {
    _historyTransaksiState = RequestState.Loading;
    notifyListeners();

    final result = await getAllTransaksi.execute();
    result.fold(
      (failure) {
        print('failure: $failure');
        _historyTransaksiState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (resultData) {
        print('resultData: $resultData');
        _historyTransaksiState = RequestState.Loaded;
        _transaksiHistory = resultData;
        notifyListeners();
      },
    );
  }
  // Future<void> fetchNowPlayingMovies() async {
  //   _historyTransaksiState = RequestState.Loading;
  //   notifyListeners();

  //   final result = await getNowPlayingMovies.execute();
  //   result.fold(
  //     (failure) {
  //       _historyTransaksiState = RequestState.Error;
  //       _message = failure.message;
  //       notifyListeners();
  //     },
  //     (moviesData) {
  //       _historyTransaksiState = RequestState.Loaded;
  //       _tansaksiHistory = moviesData;
  //       notifyListeners();
  //     },
  //   );
  // }
}
