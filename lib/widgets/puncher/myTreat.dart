import 'package:flutter/material.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';
import 'package:whisqr_puncher/consts/theme.dart';

import 'package:whisqr_puncher/models/behaviour.dart';
import 'package:whisqr_puncher/utils/l18n.dart';
import 'package:whisqr_puncher/widgets/puncher/button/counterButton.dart';

class PuncherMyTreatWidget extends StatelessWidget {
  PuncherMyTreatWidget({
    required this.punchCode,
    required this.myTreat,
  });

  final String punchCode;
  final Behaviour? myTreat;

  @override
  Widget build(BuildContext context) {
    List<dynamic> products = myTreat?.fields?['productlist'] ?? [];
    if (!(myTreat?.active ?? false)) {
      return Container();
    } else if (products.length < 1) {
      return BodyText2(l18nUtil.t('screen.puncher.no-mytreat'));
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(ThemeConsts.M_PAD),
          child:
              HeadlineText4(l18nUtil.t('screen.puncher.purchased-treats-tl')),
        ),
        ...products.map(
          (dynamic special) {
            String name = special?['productname'] ?? '?';
            String punches = special?['productpunches'].toString() ?? '?';
            return PuncherCounterButtonWidget(
              text: l18nUtil.t('screen.puncher.redeem-punch-card',
                  {'name': name, 'punches': punches}),
              onTapAdd: () {},
              onTapReduce: () {},
            );
          },
        ).toList(),
        Padding(
          padding: const EdgeInsets.all(ThemeConsts.M_PAD),
          child: HeadlineText4(l18nUtil.t('screen.puncher.received-treats-tl')),
        ),
        ...products.map(
          (dynamic special) {
            String name = special?['productname'] ?? '?';
            String punches = special?['productpunches'].toString() ?? '?';
            return PuncherCounterButtonWidget(
              text: l18nUtil.t('screen.puncher.receive-punch-card',
                  {'name': name, 'punches': punches}),
              onTapAdd: () {},
              onTapReduce: () {},
            );
          },
        ).toList(),
      ],
    );
  }
}
