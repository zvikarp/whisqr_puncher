import 'package:flutter/material.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';

import 'package:whisqr_puncher/consts/theme.dart';
import 'package:whisqr_puncher/utils/l18n.dart';

class ScannerHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeConsts.XXL_PAD,
        vertical: ThemeConsts.XL_PAD,
      ),
      child: HeadlineText1(
        l18nUtil.t('screen.scanner.header'),
        textAlign: TextAlign.center,
      ),
    );
  }
}
