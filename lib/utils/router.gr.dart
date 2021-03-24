// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;

import '../screens/puncher.dart' as _i5;
import '../screens/scanner.dart' as _i4;
import '../screens/signin.dart' as _i3;
import '../screens/splash.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SpalshScreenRoute.name: (entry) {
      return _i1.CustomPage(
          entry: entry,
          child: _i2.SpalshScreen(),
          transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    SigninScreenRoute.name: (entry) {
      return _i1.CustomPage(
          entry: entry,
          child: _i3.SigninScreen(),
          transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    ScannerScreenRoute.name: (entry) {
      return _i1.CustomPage(
          entry: entry,
          child: _i4.ScannerScreen(),
          transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    PuncherScreenRoute.name: (entry) {
      var args = entry.routeData.argsAs<PuncherScreenRouteArgs>(
          orElse: () => PuncherScreenRouteArgs());
      return _i1.CustomPage(
          entry: entry,
          child: _i5.PuncherScreen(link: args.link),
          transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SpalshScreenRoute.name, path: '/'),
        _i1.RouteConfig(SigninScreenRoute.name, path: '/signin-screen'),
        _i1.RouteConfig(ScannerScreenRoute.name, path: '/scanner-screen'),
        _i1.RouteConfig(PuncherScreenRoute.name, path: '/puncher-screen')
      ];
}

class SpalshScreenRoute extends _i1.PageRouteInfo {
  const SpalshScreenRoute() : super(name, path: '/');

  static const String name = 'SpalshScreenRoute';
}

class SigninScreenRoute extends _i1.PageRouteInfo {
  const SigninScreenRoute() : super(name, path: '/signin-screen');

  static const String name = 'SigninScreenRoute';
}

class ScannerScreenRoute extends _i1.PageRouteInfo {
  const ScannerScreenRoute() : super(name, path: '/scanner-screen');

  static const String name = 'ScannerScreenRoute';
}

class PuncherScreenRoute extends _i1.PageRouteInfo<PuncherScreenRouteArgs> {
  PuncherScreenRoute({String link})
      : super(name,
            path: '/puncher-screen', args: PuncherScreenRouteArgs(link: link));

  static const String name = 'PuncherScreenRoute';
}

class PuncherScreenRouteArgs {
  const PuncherScreenRouteArgs({this.link});

  final String link;
}
