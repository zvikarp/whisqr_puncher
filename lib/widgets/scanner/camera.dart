import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:whisqr_puncher/utils/router.gr.dart';

class ScannerCameraWidget extends StatefulWidget {
  @override
  _ScannerCameraWidgetState createState() => _ScannerCameraWidgetState();
}

class _ScannerCameraWidgetState extends State<ScannerCameraWidget> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController _controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _controller.pauseCamera();
    } else if (Platform.isIOS) {
      _controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: QRView(
        key: _qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    _controller = controller;
    controller.scannedDataStream.listen((scanData) {
      AutoRouter.of(context).push(PuncherScreenRoute(link: scanData.code));
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
