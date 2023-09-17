import 'package:flutter/material.dart';
import 'package:panel_admin_pulsa/common/state_enum.dart';
import 'package:panel_admin_pulsa/data/models/auth/auth_model.dart';
import 'package:panel_admin_pulsa/domain/usecases/auth/login_check.dart';
import 'package:panel_admin_pulsa/domain/usecases/auth/post_login.dart';
import 'package:panel_admin_pulsa/domain/usecases/auth/post_logout.dart';

class AuthNotifier extends ChangeNotifier {
  bool _isLogin = false;
  bool get isLogin => _isLogin;

  AuthModel _authModel = AuthModel(
    fullname: '',
    token: '',
    refreshToken: '',
  );

  AuthModel get authModel => _authModel;

  RequestState _loginState = RequestState.Empty;
  RequestState get loginState => _loginState;

  String _message = '';
  String get message => _message;

  AuthNotifier({
    required this.postLogin,
    required this.postLogout,
    required this.loginCheckRepo,
    // required this.getAllPegawai,
    // required this.getAllJasa,
    // required this.getAllProduct,
    // required this.openKasirRepo,
    // required this.closeKasirRepo,
  });

  // final GetNowPlayingMovies getNowPlayingMovies;
  final PostLogin postLogin;
  final PostLogout postLogout;
  final LoginCheck loginCheckRepo;
  // final GetAllPegawai getAllPegawai;
  // final GetAllJasa getAllJasa;
  // final GetAllProduct getAllProduct;
  // final OpenKasir openKasirRepo;
  // final CloseKasir closeKasirRepo;

  Future<void> login(username, password) async {
    _loginState = RequestState.Loading;

    notifyListeners();
    print('username: $username');
    print('password: $password');
    final result = await postLogin.execute(username, password);
    result.fold(
      (failure) {
        print('failure login $failure');
        _loginState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (authData) async {
        print('data login $authData');
        _loginState = RequestState.Loaded;
        _authModel = authData;
        _isLogin = true;
        notifyListeners();
      },
    );
  }

  Future<void> logout() async {
    final result = await postLogout.execute();
    result.fold(
      (failure) {
        print('failure $failure');
        _loginState = RequestState.Error;
        _message = failure.message;

        notifyListeners();
      },
      (data) async {
        print('data $data');
        _loginState = RequestState.Loaded;
        _authModel = AuthModel(
          token: '',
          fullname: '',
          refreshToken: '',
        );
        // hasil data adalah true (berhasil logout)
        _isLogin = !data;
        notifyListeners();
      },
    );
  }

  Future<void> loginCheck() async {
    final result = await loginCheckRepo.execute();

    result.fold(
      (failure) {
        print('failure loginCheck $failure');
        _loginState = RequestState.Loaded;
        _isLogin = false;
        _message = failure.message;
        notifyListeners();
      },
      (authData) async {
        print('data $authData');
        _loginState = RequestState.Loaded;
        _isLogin = true;
        _authModel = authData;
        notifyListeners();
      },
    );
  }

  void setLogin(bool value) {
    _loginState = RequestState.Loaded;
    _isLogin = value;
    notifyListeners();
  }

  void setLogout(bool value) {
    _loginState = RequestState.Error;
    _isLogin = value;
    notifyListeners();
  }
  // Future<void> openKasir(int saldoAwal) async {
  //   _loginState = RequestState.Loading;
  //   notifyListeners();
  //   print('saldoAwal $saldoAwal');
  //   final result =
  //       await openKasirRepo.execute(OpenKasirModel(saldoAwal: saldoAwal));
  //   result.fold(
  //     (failure) {
  //       print('failure openKasir $failure');
  //       _loginState = RequestState.Error;
  //       _message = failure.message;
  //       notifyListeners();
  //     },
  //     (data) async {
  //       print('data ${data.data.status}');
  //       _loginState = RequestState.Loaded;
  //       _isKasirOpen = true;
  //       notifyListeners();
  //     },
  //   );
  //   _isKasirOpen = true;
  //   notifyListeners();
  // }

  // Future<void> closeKasir(CloseKasirModel dataClose) async {
  //   var idKasir = _authModel.idKasir;
  //   _loginState = RequestState.Loading;
  //   notifyListeners();
  //   final data = CloseKasirModel(
  //       idKasir: idKasir,
  //       saldoAkhir: dataClose.saldoAkhir,
  //       keterangan: dataClose.keterangan);
  //   final result = await closeKasirRepo.execute(data);
  //   result.fold(
  //     (failure) {
  //       print('failure closeKasir $failure');
  //       _loginState = RequestState.Error;
  //       _message = failure.message;
  //       notifyListeners();
  //     },
  //     (data) async {
  //       print('data ${data.data.status}');
  //       _loginState = RequestState.Loaded;
  //       _isKasirOpen = false;
  //       notifyListeners();
  //     },
  //   );
  //   notifyListeners();
  // }

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
