import 'package:auto_route/auto_route.dart';

import 'package:whisqr_puncher/screens/puncher.dart';
import 'package:whisqr_puncher/screens/scanner.dart';
import 'package:whisqr_puncher/screens/signin.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    CustomRoute(
      page: SigninScreen,
      initial: true,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: ScannerScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: PuncherScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
  ],
)
class $AppRouter {}
