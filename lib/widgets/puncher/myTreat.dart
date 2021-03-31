import 'package:flutter/material.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';

import 'package:whisqr_puncher/models/behaviour.dart';
import 'package:whisqr_puncher/utils/enum.dart';
import 'package:whisqr_puncher/utils/l18n.dart';
import 'package:whisqr_puncher/widgets/puncher/button/counterButton.dart';

class PuncherMyTreatWidget extends StatelessWidget {
  PuncherMyTreatWidget({
    required this.punchCode,
    required this.myTreat,
  });

  final String punchCode;
  final Behaviour myTreat;

  @override
  Widget build(BuildContext context) {
    List<dynamic> products = myTreat.fields?['productlist'] ?? [];
    if (!myTreat.active) {
      return Container();
    } else if (products.length < 1) {
      return BodyText2(l18nUtil.t('screen.puncher.no-mytreat'));
    }
    return Column(
      children: [
        BodyText2(l18nUtil.t('screen.puncher.mytreat-tl')),
        ...products
            .map(
              (dynamic special) => PuncherCounterButtonWidget(
                text: enumUtil.string(special?['productname']),
                onTapAdd: () {},
                onTapReduce: () {},
              ),
            )
            .toList(),
      ],
    );
  }
}
