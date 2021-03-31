import 'package:flutter/material.dart';

import 'package:whisqr_puncher/models/behaviour.dart';
import 'package:whisqr_puncher/utils/l18n.dart';
import 'package:whisqr_puncher/widgets/puncher/button/toggleButton.dart';

class PuncherBasicWidget extends StatelessWidget {
  PuncherBasicWidget({
    required this.punchCode,
    required this.basic,
  });

  final String punchCode;
  final Behaviour basic;

  @override
  Widget build(BuildContext context) {
    return PuncherToggleButtonWidget(
      text: l18nUtil.t('screen.puncher.is-punched'),
      value: true,
      onToggle: (value) {},
    );
  }
}
