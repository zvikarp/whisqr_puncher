// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;

import '../screens/puncher.dart' as _i4;
import '../screens/scanner.dart' as _i3;
import '../screens/signin.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SigninScreenRoute.name: (entry) {
      return _i1.CustomPage(
          entry: entry,
          child: _i2.SigninScreen(),
          transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    ScannerScreenRoute.name: (entry) {
      return _i1.CustomPage(
          entry: entry,
          child: _i3.ScannerScreen(),
          transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    PuncherScreenRoute.name: (entry) {
      return _i1.CustomPage(
          entry: entry,
          child: _i4.PuncherScreen(),
          transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SigninScreenRoute.name, path: '/'),
        _i1.RouteConfig(ScannerScreenRoute.name, path: '/scanner-screen'),
        _i1.RouteConfig(PuncherScreenRoute.name, path: '/puncher-screen')
      ];
}

class SigninScreenRoute extends _i1.PageRouteInfo {
  const SigninScreenRoute() : super(name, path: '/');

  static const String name = 'SigninScreenRoute';
}

class ScannerScreenRoute extends _i1.PageRouteInfo {
  const ScannerScreenRoute() : super(name, path: '/scanner-screen');

  static const String name = 'ScannerScreenRoute';
}

class PuncherScreenRoute extends _i1.PageRouteInfo {
  const PuncherScreenRoute() : super(name, path: '/puncher-screen');

  static const String name = 'PuncherScreenRoute';
}
