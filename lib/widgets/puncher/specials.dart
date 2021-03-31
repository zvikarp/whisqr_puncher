import 'package:flutter/material.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';

import 'package:whisqr_puncher/models/behaviour.dart';
import 'package:whisqr_puncher/utils/enum.dart';
import 'package:whisqr_puncher/utils/l18n.dart';
import 'package:whisqr_puncher/widgets/puncher/button/counterButton.dart';

class PuncherSpecialsWidget extends StatelessWidget {
  PuncherSpecialsWidget({
    required this.punchCode,
    required this.opportunist,
  });

  final String punchCode;
  final Behaviour opportunist;

  @override
  Widget build(BuildContext context) {
    List<dynamic> specials = opportunist.fields?['speciallist'] ?? [];
    if (!opportunist.active) {
      return Container();
    } else if (specials.length < 1) {
      return BodyText2(l18nUtil.t('screen.puncher.no-specials'));
    }
    return Column(
      children: [
        BodyText2(l18nUtil.t('screen.puncher.specials-tl')),
        ...specials
            .map(
              (dynamic special) => PuncherCounterButtonWidget(
                text: enumUtil.string(special?['specialname']),
                onTapAdd: () {},
                onTapReduce: () {},
              ),
            )
            .toList(),
      ],
    );
  }
}
