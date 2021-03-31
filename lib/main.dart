import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

import 'package:whisqr_puncher/consts/general.dart';
import 'package:whisqr_puncher/stores/business.dart';
import 'package:whisqr_puncher/stores/customer.dart';
import 'package:whisqr_puncher/utils/l18n.dart';
import 'package:whisqr_puncher/utils/router.gr.dart';
import 'package:whisqr_puncher/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await l18nUtil.init();
  runApp(
    MultiProvider(providers: [
      Provider<BusinessStore>(create: (_) => BusinessStore()),
      Provider<CustomerStore>(create: (_) => CustomerStore()),
    ], child: App()),
  );
}

class App extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  final Locale? _locale = l18nUtil.locale;

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp.router(
        theme: themeUtil.getTheme(),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        title: l18nUtil.t('general.app-name'),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: GeneralConsts.LOCALES,
        locale: _locale,
      ),
    );
  }
}
