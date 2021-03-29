import 'package:flutter/material.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';

import 'package:whisqr_puncher/consts/theme.dart';

class PuncherCustomerInfoWidget extends StatelessWidget {
  PuncherCustomerInfoWidget({
    @required this.punchesCount,
  });

  final int punchesCount;

  Widget _totalPunches() {
    return Container(
      margin: EdgeInsets.all(ThemeConsts.L_PAD),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(150),
        color: ThemeConsts.PRIMARY_COLOR,
      ),
      child: Center(
        child: punchesCount >= 0
            ? HeadlineText2(punchesCount.toString())
            : Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _totalPunches();
  }
}
