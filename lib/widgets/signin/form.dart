import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:whisqr_puncher/consts/general.dart';
import 'package:whisqr_puncher/consts/theme.dart';
import 'package:whisqr_puncher/enums/status.dart';
import 'package:whisqr_puncher/extensions/iterable.dart';
import 'package:whisqr_puncher/models/user.dart';
import 'package:whisqr_puncher/utils/api/index.dart';
import 'package:whisqr_puncher/utils/enum.dart';
import 'package:whisqr_puncher/utils/l18n.dart';
import 'package:whisqr_puncher/utils/router.gr.dart';
import 'package:whisqr_puncher/utils/snackbar.dart';
import 'package:whisqr_puncher/utils/storage.dart';
import 'package:whisqr_puncher/widgets/core/spacer.dart';
import 'package:whisqr_puncher/widgets/signin/businessSelector.dart';

class SigninFormWidget extends StatefulWidget {
  @override
  _SigninFormWidgetState createState() => _SigninFormWidgetState();
}

class _SigninFormWidgetState extends State<SigninFormWidget> {
  String _email;
  String _password;
  bool _loading = false;
  String _businessCode;
  String _locationCode;

  Future<void> _onTapForgotPassword() async {
    await launch(GeneralConsts.FORGOT_PASSWORD_LINK);
  }

  Future<Response> _sendSigninRequest() async {
    Response response =
        await apiUtil.user.login(_email, _password, _businessCode);
    Map<String, dynamic> data = response?.data ?? [];
    if (data['status'] == 'success') {
      User user = User(
        email: _email,
        pk: data['keyPublic'],
        sk: data['keySecret'],
        businessCode: _businessCode,
        locationCode: _locationCode,
      );
      storageUtil.setUser(user);
      AutoRouter.of(context).replace(SpalshScreenRoute());
    }
    return response;
  }

  Future<Map<String, String>> _openBusinessSelector(List businessCodes) async {
    Map<String, String> businessLocationCodes =
        await showDialog<Map<String, String>>(
      context: context,
      builder: (BuildContext context) {
        return SigninBusinessSelectorWidget(businessCodes: businessCodes);
      },
    );
    return businessLocationCodes;
  }

  Future<void> _onTapSignin() async {
    setState(() => _loading = true);
    Response response = await _sendSigninRequest();
    Status status =
        enumUtil.fromString(response?.data['status'], Status.values);
    if (status == Status.PENDING) {
      Map<String, String> businessLocationCodes =
          await _openBusinessSelector(response?.data['businesses']);
      if (businessLocationCodes != null) {
        setState(() {
          _businessCode = businessLocationCodes.keys.first;
          _locationCode = businessLocationCodes.values.first;
        });
        response = await _sendSigninRequest();
        status = enumUtil.fromString(response?.data['status'], Status.values);
      }
    }
    if (status == Status.FAILURE)
      snackbarUtil.show(
          response.data['message'] ?? l18nUtil.t('msg.unknown-server-error'));
    setState(() => _loading = false);
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
            onChanged: (String value) => setState(() => _email = value),
            decoration: InputDecoration(
              hintText: l18nUtil.t('screen.signin.email-hint'),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            onChanged: (String value) => setState(() => _password = value),
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
          if (_loading) CircularProgressIndicator(),
          if (!_loading)
            OutlinedButton(
              onPressed: _onTapSignin,
              child: BodyText2(l18nUtil.t('screen.signin.signin-btn')),
            ),
        ].addBetween(CoreSpacer(height: ThemeConsts.L_PAD)),
      ),
    );
  }
}
