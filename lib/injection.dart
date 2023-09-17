import 'package:panel_admin_pulsa/common/cache_json.dart';
import 'package:panel_admin_pulsa/data/datasources/auth_local_data_source.dart';
import 'package:panel_admin_pulsa/data/datasources/auth_remote_data_source.dart';
import 'package:panel_admin_pulsa/data/datasources/banners_remote_data_source.dart';
import 'package:panel_admin_pulsa/data/datasources/db/database_helper.dart';
import 'package:panel_admin_pulsa/data/datasources/products_remote_data_source.dart';
import 'package:panel_admin_pulsa/data/datasources/transaksi_remote_data_source.dart';
import 'package:panel_admin_pulsa/data/repositories/auth_repository_impl.dart';
import 'package:panel_admin_pulsa/data/repositories/banners_repository_impl.dart';
import 'package:panel_admin_pulsa/data/repositories/products_repository_impl.dart';
import 'package:panel_admin_pulsa/data/repositories/transaksi_repository_impl.dart';

import 'package:panel_admin_pulsa/domain/repositories/auth_repository.dart';
import 'package:panel_admin_pulsa/domain/repositories/banner_repository.dart';
import 'package:panel_admin_pulsa/domain/repositories/products-repository.dart';
import 'package:panel_admin_pulsa/domain/repositories/transaksi_repository.dart';
import 'package:panel_admin_pulsa/domain/usecases/auth/login_check.dart';
import 'package:panel_admin_pulsa/domain/usecases/auth/post_login.dart';
import 'package:panel_admin_pulsa/domain/usecases/auth/post_logout.dart';
import 'package:panel_admin_pulsa/domain/usecases/banners/get_all_banner.dart';
import 'package:panel_admin_pulsa/domain/usecases/get_movie_recommendations.dart';
import 'package:panel_admin_pulsa/domain/usecases/get_now_playing_movies.dart';
import 'package:panel_admin_pulsa/domain/usecases/get_popular_movies.dart';
import 'package:panel_admin_pulsa/domain/usecases/get_top_rated_movies.dart';
import 'package:panel_admin_pulsa/domain/usecases/get_watchlist_movies.dart';
import 'package:panel_admin_pulsa/domain/usecases/get_watchlist_status.dart';
import 'package:panel_admin_pulsa/domain/usecases/products/get_all_products.dart';
import 'package:panel_admin_pulsa/domain/usecases/search_movies.dart';
import 'package:panel_admin_pulsa/domain/usecases/transaksi/get_all_transaksi.dart';
import 'package:panel_admin_pulsa/presentation/provider/auth_notifier.dart';
import 'package:panel_admin_pulsa/presentation/provider/banners_notifier.dart';

import 'package:panel_admin_pulsa/presentation/provider/movie_search_notifier.dart';
import 'package:panel_admin_pulsa/presentation/provider/popular_movies_notifier.dart';
import 'package:panel_admin_pulsa/presentation/provider/product_notifier.dart';
import 'package:panel_admin_pulsa/presentation/provider/top_rated_movies_notifier.dart';
import 'package:panel_admin_pulsa/presentation/provider/transaksi_notifier.dart';
import 'package:panel_admin_pulsa/presentation/provider/watchlist_movie_notifier.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

//NOTE - Locator is a service locator
final locator = GetIt.instance;

void init() {
// use case
  locator.registerLazySingleton(() => GetAllBanner(locator()));
  locator.registerLazySingleton(() => GetAllTransaksi(locator()));
  locator.registerLazySingleton(() => GetAllProducts(locator()));
  locator.registerLazySingleton(() => LoginCheck(locator()));
  locator.registerLazySingleton(() => PostLogin(locator()));
  locator.registerLazySingleton(() => PostLogout(locator()));

  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  // locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  // locator.registerLazySingleton(() => SaveWatchlist(locator()));
  // locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));

// data sources
  locator.registerLazySingleton<ProductsRemoteDataSource>(
    () => ProductsRemoteDataSourceImpl(
      client: locator(),
      databaseHelper: locator(),
    ),
  );
  locator.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(
      databaseHelper: locator(),
      jsonCache: locator(),
    ),
  );
  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      client: locator(),
      databaseHelper: locator(),
    ),
  );
  locator.registerLazySingleton<TransaksiRemoteDataSource>(
    () => TransaksiRemoteDataSourceImpl(
      client: locator(),
      databaseHelper: locator(),
    ),
  );
  locator.registerLazySingleton<BannersRemoteDataSource>(
    () => BannersRemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // locator.registerLazySingleton<MovieRemoteDataSource>(
  // () => MovieRemoteDataSourceImpl(client: locator()));
  // locator.registerLazySingleton<MovieLocalDataSource>(
  //     () => MovieLocalDataSourceImpl(databaseHelper: locator()));

// repository

  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
      jsonCache: locator(),
    ),
  );
  locator.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(
      remoteDataSource: locator(),
      // localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<TransaksiRepository>(
    () => TransaksiRepositoryImpl(
      remoteDataSource: locator(),
      // localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<BannersRepository>(
    () => BannersRepositoryImpl(
      remoteDataSource: locator(),
      // localDataSource: locator(),
    ),
  );
  // locator.registerLazySingleton<MovieRepository>(
  //   () => MovieRepositoryImpl(
  //     remoteDataSource: locator(),
  //     localDataSource: locator(),
  //   ),
  // );

// provider
  locator.registerFactory(
    () => AuthNotifier(
      postLogin: locator(),
      postLogout: locator(),
      loginCheckRepo: locator(),
    ),
  );
  locator.registerFactory(
    () => ProductNotifier(
      getAllProducts: locator(),
    ),
  );
  locator.registerFactory(
    () => BannersNotifier(
      getAllBanner: locator(),
    ),
  );

  // locator.registerFactory(
  //   () => MovieDetailNotifier(
  //     getMovieDetail: locator(),
  //     getMovieRecommendations: locator(),
  //     getWatchListStatus: locator(),
  //     saveWatchlist: locator(),
  //     removeWatchlist: locator(),
  //   ),
  // );
  locator.registerFactory(
    () => MovieSearchNotifier(
      searchMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMoviesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMoviesNotifier(
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistMovieNotifier(
      getWatchlistMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => TransaksiNotifier(
      getAllTransaksi: locator(),
    ),
  );

  // // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  locator.registerLazySingleton(() => JsonCache());

  // external
  locator.registerLazySingleton(() => http.Client());
}
