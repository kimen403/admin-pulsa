import 'package:flutter/material.dart';
import 'package:panel_admin_pulsa/common/state_enum.dart';
import 'package:panel_admin_pulsa/domain/entities/banners.dart';

import 'package:panel_admin_pulsa/domain/usecases/banners/get_all_banner.dart';

class BannersNotifier extends ChangeNotifier {
  // NOTE: DATA
  late List<Banners> _banners;
  List<Banners> get banners => _banners;

  // NOTE - STATE MANAGEMENT
  RequestState _bannersState = RequestState.Empty;
  RequestState get bannersState => _bannersState;

  // NOTE - MESSAGE
  String _message = '';
  String get message => _message;

  // NOTE - CONSTRUCTOR
  BannersNotifier({
    required this.getAllBanner,
  });

  // NOTE - FUNCTION
  final GetAllBanner getAllBanner;

  // NOTE - FUNCTION
  Future<void> fetchBanners() async {
    _bannersState = RequestState.Loading;
    notifyListeners();

    final result = await getAllBanner.execute();
    result.fold(
      (failure) {
        print('failure $failure');
        _bannersState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (bannersData) {
        print('bannersData $bannersData');
        _bannersState = RequestState.Loaded;
        _banners = bannersData;
        notifyListeners();
      },
    );
  }
  // Future<void> fetchNowPlayingMovies() async {
  //   _nowPlayingState = RequestState.Loading;
  //   notifyListeners();

  //   final result = await getNowPlayingMovies.execute();
  //   result.fold(
  //     (failure) {
  //       _nowPlayingState = RequestState.Error;
  //       _message = failure.message;
  //       notifyListeners();
  //     },
  //     (moviesData) {
  //       _nowPlayingState = RequestState.Loaded;
  //       _nowPlayingMovies = moviesData;
  //       notifyListeners();
  //     },
  //   );
  // }
}
