import 'package:flutter/material.dart';
import 'package:panel_admin_pulsa/common/state_enum.dart';
import 'package:panel_admin_pulsa/domain/entities/product.dart';
import 'package:panel_admin_pulsa/domain/usecases/products/get_all_products.dart';

class ProductNotifier extends ChangeNotifier {
  // NOTE: DATA
  // var _nowPlayingMovies = <Movie>[];
  // List<Movie> get nowPlayingMovies => _nowPlayingMovies;

  var _listProducts = <Product>[];
  List<Product> get listProducts => _listProducts;

  // NOTE - STATE MANAGEMENT
  RequestState _listProductsState = RequestState.Empty;
  RequestState get listProductsState => _listProductsState;
  // RequestState _nowPlayingState = RequestState.Empty;
  // RequestState get nowPlayingState => _nowPlayingState;

  // NOTE - MESSAGE
  String _message = '';
  String get message => _message;

  // NOTE - CONSTRUCTOR
  ProductNotifier({
    required this.getAllProducts,
    // required this.getNowPlayingMovies,
    // required this.getPopularMovies,
    // required this.getTopRatedMovies,
  });

  // NOTE - FUNCTION
  final GetAllProducts getAllProducts;
  // final GetNowPlayingMovies getNowPlayingMovies;
  // final GetPopularMovies getPopularMovies;
  // final GetTopRatedMovies getTopRatedMovies;

  // NOTE - FUNCTION
  Future<void> fecthProductsList() async {
    _listProductsState = RequestState.Loading;
    notifyListeners();

    final result = await getAllProducts.execute();
    result.fold(
      (failure) {
        _listProductsState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (resultData) {
        _listProductsState = RequestState.Loaded;
        print(resultData);
        _listProducts = resultData;
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
