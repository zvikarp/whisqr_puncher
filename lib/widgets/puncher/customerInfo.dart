import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';

import 'package:whisqr_puncher/consts/theme.dart';
import 'package:whisqr_puncher/models/customer.dart';
import 'package:whisqr_puncher/stores/index.dart';
import 'package:whisqr_puncher/widgets/core/spacer.dart';

class PuncherCustomerInfoWidget extends StatelessWidget {
  Widget _totalPunches(int total) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(150),
        color: ThemeConsts.PRIMARY_COLOR,
      ),
      child: Center(child: HeadlineText2(total.toString())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      Customer? customer = stores.customer(context, true).customer;
      return Padding(
        padding: EdgeInsets.all(ThemeConsts.L_PAD),
        child: Column(
          children: [
            _totalPunches(customer?.punchTotal ?? 0),
            CoreSpacer(height: ThemeConsts.L_PAD),
            BodyText2('Welcome ${customer?.name ?? 'No name'}'),
          ],
        ),
      );
    });
  }
}
