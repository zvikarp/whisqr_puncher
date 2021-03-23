import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:whisqr_puncher/consts/general.dart';
import 'package:whisqr_puncher/utils/l18n.dart';
import 'package:whisqr_puncher/utils/router.gr.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  final Locale _locale = l18nUtil.locale;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: 'Whisqr Puncher',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: GeneralConsts.LOCALES,
      locale: _locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
