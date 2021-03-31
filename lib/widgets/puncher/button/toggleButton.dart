import 'package:flutter/material.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';

import 'package:whisqr_puncher/consts/theme.dart';

class PuncherToggleButtonWidget extends StatelessWidget {
  PuncherToggleButtonWidget({
    required this.text,
    this.disabled = false,
    required this.value,
    required this.onToggle,
  });

  final String text;
  final bool disabled;
  final bool value;
  final Function(bool) onToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? () {} : onToggle(!value),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        margin: EdgeInsets.symmetric(
          horizontal: ThemeConsts.M_PAD,
          vertical: ThemeConsts.S_PAD / 2,
        ),
        padding: EdgeInsets.all(ThemeConsts.L_PAD),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ThemeConsts.S_RADIUS),
          color: (value && !disabled) ? Colors.green : Colors.black12,
        ),
        child: Center(child: BodyText2(text)),
      ),
    );
  }
}
