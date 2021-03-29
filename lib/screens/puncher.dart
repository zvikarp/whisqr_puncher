import 'package:flutter/material.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';

import 'package:whisqr_puncher/widgets/puncher/options.dart';

class PuncherScreen extends StatelessWidget {
  PuncherScreen({
    @required this.link,
  });

  final String link;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BodyText2(link),
              PuncherOptionsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
