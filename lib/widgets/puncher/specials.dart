import 'package:flutter/material.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';

import 'package:whisqr_puncher/extensions/string.dart';
import 'package:whisqr_puncher/models/behaviour.dart';
import 'package:whisqr_puncher/utils/l18n.dart';
import 'package:whisqr_puncher/widgets/puncher/button/counterButton.dart';

class PuncherSpecialsWidget extends StatelessWidget {
  PuncherSpecialsWidget({
    required this.punchCode,
    required this.opportunist,
  });

  final String punchCode;
  final Behaviour? opportunist;

  @override
  Widget build(BuildContext context) {
    List<dynamic> specials = opportunist?.fields?['speciallist'] ?? [];
    if (!(opportunist?.active ?? false)) {
      return Container();
    } else if (specials.length < 1) {
      return BodyText2(l18nUtil.t('screen.puncher.no-specials'));
    }
    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.all(ThemeConsts.M_PAD),
        //   child: HeadlineText4(l18nUtil.t('screen.puncher.specials-tl')),
        // ),
        ...specials.map(
          (dynamic special) {
            if ((special?['active'] ?? true).toString().parseBool()) {
              String name = special?['specialname'] ?? '?';
              String punches = special?['punches'].toString() ?? '?';
              return PuncherCounterButtonWidget(
                text: l18nUtil.t('screen.puncher.for-punch-card',
                    {'name': name, 'punches': punches}),
                onTapAdd: () {},
                onTapReduce: () {},
              );
            }
            return Container();
          },
        ).toList(),
      ],
    );
  }
}
