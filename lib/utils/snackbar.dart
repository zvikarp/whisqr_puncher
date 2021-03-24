import 'package:flutter_text_helpers/flutter_text_helpers.dart';
import 'package:overlay_support/overlay_support.dart';

import 'package:whisqr_puncher/consts/theme.dart';

class SnackbarUtil {
  void show(String message) {
    showSimpleNotification(
        BodyText2(
          message,
          color: ThemeConsts.LIGHT_TEXT_COLOR,
        ),
        background: ThemeConsts.DARK_TEXT_COLOR,
        position: NotificationPosition.bottom);
  }
}

final SnackbarUtil snackbarUtil = SnackbarUtil();
