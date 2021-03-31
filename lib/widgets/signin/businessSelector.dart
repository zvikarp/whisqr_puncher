import 'package:flutter/material.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';

import 'package:whisqr_puncher/consts/theme.dart';
import 'package:whisqr_puncher/utils/l18n.dart';

class SigninBusinessSelectorWidget extends StatelessWidget {
  SigninBusinessSelectorWidget({
    required this.businessCodes,
  });

  final List? businessCodes;

  Widget _businessSection(BuildContext context, Map business) {
    String businessCode = business['businesscode'];
    return Padding(
      padding: const EdgeInsets.all(ThemeConsts.S_PAD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BodyText2(business['businessname']),
          ...business['locations'].map(
            (location) => SimpleDialogOption(
              onPressed: () => Navigator.pop<Map<String, String>>(
                  context, {businessCode: location['locationcode'].toString()}),
              child: Text(location['locationname']),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: Text(l18nUtil.t('screen.signin.business-selector-tl')),
        children: [
          SingleChildScrollView(
            child: Column(
              children: businessCodes!
                  .map((business) =>
                      _businessSection(context, Map.from(business)))
                  .toList(),
            ),
          ),
        ]);
  }
}
