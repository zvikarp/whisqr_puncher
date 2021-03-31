import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:whisqr_puncher/consts/general.dart';
import 'package:whisqr_puncher/consts/theme.dart';
import 'package:whisqr_puncher/utils/l18n.dart';

class SigninActionsWidget extends StatelessWidget {
  Future<void> _onTapRegister() async {
    await launch(GeneralConsts.REGISTER_LINK);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeConsts.ACCENT_COLOR,
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeConsts.XXL_PAD,
        vertical: ThemeConsts.XL_PAD,
      ),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
          text: l18nUtil.t('screen.signin.action-1'),
          style: Theme.of(context).textTheme.bodyText2,
        ),
        TextSpan(
          text: l18nUtil.t('screen.signin.action-2'),
          recognizer: TapGestureRecognizer()..onTap = _onTapRegister,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                decoration: TextDecoration.underline,
              ),
        ),
      ])),
    );
  }
}
