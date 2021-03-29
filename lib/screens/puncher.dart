import 'package:flutter/material.dart';
import 'package:whisqr_puncher/widgets/puncher/customerInfo.dart';

import 'package:whisqr_puncher/widgets/puncher/options.dart';

class PuncherScreen extends StatelessWidget {
  PuncherScreen({
    @required this.link,
  });

  final String link;

  String _getCardCode(String link) {
    int pos = link.lastIndexOf('/');
    String cardCode = (pos != -1) ? link.substring(pos + 1) : link;
    return cardCode;
  }

  @override
  Widget build(BuildContext context) {
    String cardCode = _getCardCode(link);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PuncherCustomerInfoWidget(cardCode: cardCode),
              PuncherOptionsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
