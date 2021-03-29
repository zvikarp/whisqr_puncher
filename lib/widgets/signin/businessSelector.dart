import 'package:flutter/material.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';

import 'package:whisqr_puncher/consts/theme.dart';

class SigninBusinessSelectorWidget extends StatelessWidget {
  SigninBusinessSelectorWidget({
    @required this.businessCodes,
  });

  final List businessCodes;

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
              onPressed: () => Navigator.pop(context, businessCode),
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
      title: const Text('Select Business'),
      children: businessCodes
          .map((business) => _businessSection(context, Map.from(business)))
          .toList(),
    );
  }
}
