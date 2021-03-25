import 'package:flutter/material.dart';

import 'package:whisqr_puncher/widgets/puncher/options.dart';

class PuncherScreen extends StatelessWidget {
  PuncherScreen({
    @required this.link,
  });

  final String link;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PuncherOptionsWidget(),
        ],
      ),
    );
  }
}
