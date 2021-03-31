import 'package:flutter/material.dart';

import 'package:whisqr_puncher/models/behaviour.dart';
import 'package:whisqr_puncher/utils/l18n.dart';
import 'package:whisqr_puncher/widgets/puncher/button/counterButton.dart';

class PuncherFriendsWidget extends StatelessWidget {
  PuncherFriendsWidget({
    required this.punchCode,
    required this.friends,
  });

  final String punchCode;
  final Behaviour? friends;

  @override
  Widget build(BuildContext context) {
    return PuncherCounterButtonWidget(
      text: l18nUtil.t('screen.puncher.no-friends'),
      onTapAdd: () {},
      onTapReduce: () {},
    );
  }
}
