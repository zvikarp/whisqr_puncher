import 'package:flutter/material.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:whisqr_puncher/consts/general.dart';
import 'package:whisqr_puncher/consts/theme.dart';
import 'package:whisqr_puncher/extensions/iterable.dart';
import 'package:whisqr_puncher/utils/l18n.dart';
import 'package:whisqr_puncher/widgets/core/spacer.dart';

class SigninFormWidget extends StatelessWidget {
  Future<void> _onTapForgotPassword() async {
    await launch(GeneralConsts.FORGOT_PASSWORD_LINK);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeConsts.XL_PAD,
        vertical: ThemeConsts.XL_PAD,
      ),
      child: Column(
        children: <Widget>[
          BodyText2(l18nUtil.t('screen.signin.form-tl')),
          TextField(
            decoration: InputDecoration(
              hintText: l18nUtil.t('screen.signin.email-hint'),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: l18nUtil.t('screen.signin.password-hint'),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.go,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              child: BodyText2(l18nUtil.t('screen.signin.forgot-password-btn')),
              onPressed: _onTapForgotPassword,
            ),
          ),
        ].addBetween(CoreSpacer(height: ThemeConsts.L_PAD)),
      ),
    );
  }
}
