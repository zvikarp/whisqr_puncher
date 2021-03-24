import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';

import 'package:whisqr_puncher/consts/theme.dart';
import 'package:whisqr_puncher/utils/l18n.dart';
import 'package:whisqr_puncher/utils/router.gr.dart';
import 'package:whisqr_puncher/utils/storage.dart';

class ScannerHeaderWidget extends StatelessWidget {
  Future<void> _onTapSignout(BuildContext context) async {
    await storageUtil.deleteUser();
    AutoRouter.of(context).replace(SpalshScreenRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeConsts.XXL_PAD,
        vertical: ThemeConsts.XL_PAD,
      ),
      child: Column(
        children: [
          HeadlineText1(
            l18nUtil.t('screen.scanner.header'),
            textAlign: TextAlign.center,
          ),
          TextButton(
              onPressed: () => _onTapSignout(context),
              child: BodyText2(l18nUtil.t('screen.scanner.signout-btn')))
        ],
      ),
    );
  }
}
