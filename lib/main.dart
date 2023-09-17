import 'package:panel_admin_pulsa/common/constants.dart';
import 'package:panel_admin_pulsa/common/state_enum.dart';
import 'package:panel_admin_pulsa/common/utils.dart';
import 'package:panel_admin_pulsa/presentation/pages/banners/banners_page.dart';
// import 'package:panel_admin_pulsa/presentation/pages/about_page.dart';
import 'package:panel_admin_pulsa/presentation/pages/home/home.dart';
import 'package:panel_admin_pulsa/presentation/pages/login/login_page.dart';
import 'package:panel_admin_pulsa/presentation/pages/products/products.dart';
import 'package:panel_admin_pulsa/presentation/pages/transaksi/transaksi_page.dart';
import 'package:panel_admin_pulsa/presentation/provider/auth_notifier.dart';
import 'package:panel_admin_pulsa/presentation/provider/banners_notifier.dart';

import 'package:panel_admin_pulsa/presentation/provider/product_notifier.dart';

import 'package:panel_admin_pulsa/presentation/provider/transaksi_notifier.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:panel_admin_pulsa/injection.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductNotifier(
            getAllProducts: di.locator(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthNotifier(
            postLogin: di.locator(),
            postLogout: di.locator(),
            loginCheckRepo: di.locator(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => TransaksiNotifier(
            getAllTransaksi: di.locator(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => BannersNotifier(
            getAllBanner: di.locator(),
          ),
        )
      ],
      child: LoginCheck(),
    );
  }
}

class LoginCheck extends StatefulWidget {
  const LoginCheck({super.key});

  @override
  State<LoginCheck> createState() => _LoginCheckState();
}

class _LoginCheckState extends State<LoginCheck> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<AuthNotifier>().loginCheck());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthNotifier>(
      builder: (context, provider, child) {
        switch (provider.loginState) {
          case RequestState.Loading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.Loaded:
            if (provider.isLogin) {
              return Main();
            } else {
              return LoginPage();
            }
          case RequestState.Error:
            return const Center(child: Text('Error'));
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class Main extends StatefulWidget {
  const Main({
    super.key,
  });

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  Widget? _getPageWidget(RouteSettings settings) {
    if (settings.name == null) {
      return null;
    }
    final uri = Uri.parse(settings.name!);
    switch (uri.path) {
      case '/':
        return DashboardPage();
      case (ProductsPage.ROUTE_NAME):
        return ProductsPage();
      case (TransaksiPage.ROUTE_NAME):
        return const TransaksiPage();
      case (BannersPage.ROUTE_NAME):
        return const BannersPage();
      // case '/secondLevelItem1':
      //   return SecondLevelItem1Page();
      // case '/secondLevelItem2':
      //   return SecondLevelItem2Page();
      // case '/thirdLevelItem1':
      //   return ThirdLevelItem1Page();
      // case '/thirdLevelItem2':
      //   return ThirdLevelItem2Page();
      default:
        return const Scaffold(
          body: Center(
            child: Text('Page not found :('),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: kColorScheme,
        primaryColor: kRichBlack,
        scaffoldBackgroundColor: kRichBlack,
        textTheme: kTextTheme,
        secondaryHeaderColor: secondaryColor,
      ),
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: [
      //   const Locale('en'), // English
      //   Locale('id'), // Spanish
      // ],
      // home: DashboardPage(),
      initialRoute: '/',
      navigatorObservers: [routeObserver],
      onGenerateRoute: (RouteSettings settings) {
        final page = _getPageWidget(settings);
        if (page != null) {
          print('page: $page');
          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => page,
            transitionsBuilder: (_, anim, __, child) {
              return FadeTransition(
                opacity: anim,
                child: child,
              );
            },
          );
        }
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => DashboardPage(),
          transitionsBuilder: (_, anim, __, child) {
            return FadeTransition(
              opacity: anim,
              child: child,
            );
          },
        );
        // switch (settings.name) {
        //   case '/home':
        //     return MaterialPageRoute(builder: (_) => HomeMoviePage());
        //   case PopularMoviesPage.ROUTE_NAME:
        //     return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
        //   case TopRatedMoviesPage.ROUTE_NAME:
        //     return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
        //   case MovieDetailPage.ROUTE_NAME:
        //     final id = settings.arguments as int;
        //     return MaterialPageRoute(
        //       builder: (_) => MovieDetailPage(id: id),
        //       settings: settings,
        //     );
        //   case SearchPage.ROUTE_NAME:
        //     return CupertinoPageRoute(builder: (_) => SearchPage());
        //   case WatchlistMoviesPage.ROUTE_NAME:
        //     return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
        //   case AboutPage.ROUTE_NAME:
        //     return MaterialPageRoute(builder: (_) => AboutPage());
        //   default:
        //     return MaterialPageRoute(
        //       builder: (_) {
        //         return Scaffold(
        //           body: Center(
        //             child: Text('Page not found :('),
        //           ),
        //         );
        //       },
        //     );
        // }
      },
    );
  }
}
