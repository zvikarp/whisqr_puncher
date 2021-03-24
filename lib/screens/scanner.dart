import 'package:flutter/material.dart';

import 'package:whisqr_puncher/widgets/scanner/camera.dart';
import 'package:whisqr_puncher/widgets/scanner/header.dart';

class ScannerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ScannerHeaderWidget(),
            ScannerCameraWidget(),
          ],
        ),
      ),
    );
  }
}
