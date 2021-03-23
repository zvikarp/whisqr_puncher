import 'package:flutter/material.dart';

import 'package:whisqr_puncher/utils/router.gr.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: 'Whisqr Puncher',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
