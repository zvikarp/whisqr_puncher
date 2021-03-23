import 'package:flutter/material.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';

import 'package:whisqr_puncher/consts/theme.dart';

class SigninActionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeConsts.XXL_PAD,
        vertical: ThemeConsts.XL_PAD,
      ),
      child: HeadlineText1(
        "New to Whisqr? Register an account",
        textAlign: TextAlign.center,
      ),
    );
  }
}
