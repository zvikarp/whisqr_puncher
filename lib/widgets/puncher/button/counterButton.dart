import 'package:flutter/material.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';

import 'package:whisqr_puncher/consts/theme.dart';

class PuncherCounterButtonWidget extends StatelessWidget {
  PuncherCounterButtonWidget({
    required this.text,
    this.addDisabled = false,
    this.reduceDisabled = false,
    this.counter,
    required this.onTapAdd,
    required this.onTapReduce,
  });

  final String text;
  final int? counter;
  final bool addDisabled;
  final bool reduceDisabled;
  final Function onTapAdd;
  final Function onTapReduce;

  Widget _reduce() {
    return _button(
      Icons.remove,
      ThemeConsts.RED_COLOR,
      onTapReduce,
      reduceDisabled,
    );
  }

  Widget _add() {
    return _button(
      Icons.add,
      ThemeConsts.GREEN_COLOR,
      onTapAdd,
      addDisabled,
    );
  }

  Widget _button(IconData icon, Color color, Function onTap, bool disabled) {
    return Container(
      padding: EdgeInsets.all(ThemeConsts.S_PAD),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ThemeConsts.S_RADIUS),
        color: color.withOpacity(disabled ? 0.4 : 1),
      ),
      child: IconButton(
        icon: Icon(icon),
        color: ThemeConsts.LIGHT_TEXT_COLOR,
        onPressed: disabled ? () {} : onTap as void Function()?,
      ),
    );
  }

  Widget _name() {
    return Expanded(
        child: Center(
            child: Padding(
      padding: EdgeInsets.all(ThemeConsts.S_PAD),
      child: Text(text, textAlign: TextAlign.center),
    )));
  }

  Widget _counter() {
    return Container(
      margin: EdgeInsets.all(ThemeConsts.S_PAD),
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(150),
        color: ThemeConsts.PRIMARY_COLOR,
      ),
      child: Center(
          child: HeadlineText4(
        counter.toString(),
        color: ThemeConsts.LIGHT_TEXT_COLOR,
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: ThemeConsts.M_PAD,
        vertical: ThemeConsts.S_PAD / 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ThemeConsts.S_RADIUS),
        color: ThemeConsts.DISABLED_COLOR,
      ),
      child: Row(
        children: [
          _reduce(),
          _name(),
          if (counter != null) _counter(),
          _add(),
        ],
      ),
    );
  }
}
