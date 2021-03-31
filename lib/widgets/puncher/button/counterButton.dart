import 'package:flutter/material.dart';

import 'package:whisqr_puncher/consts/theme.dart';

class PuncherCounterButtonWidget extends StatelessWidget {
  PuncherCounterButtonWidget({
    required this.text,
    this.addDisabled = false,
    this.reduceDisabled = false,
    required this.onTapAdd,
    required this.onTapReduce,
  });

  final String text;
  final bool addDisabled;
  final bool reduceDisabled;
  final Function onTapAdd;
  final Function onTapReduce;

  Widget _reduce() {
    return _button(
      Icons.remove,
      Colors.red,
      onTapReduce,
      reduceDisabled,
    );
  }

  Widget _add() {
    return _button(
      Icons.add,
      Colors.green,
      onTapAdd,
      addDisabled,
    );
  }

  Widget _button(IconData icon, Color color, Function onTap, bool disabled) {
    return Container(
      padding: EdgeInsets.all(ThemeConsts.S_PAD),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ThemeConsts.S_RADIUS),
        color: color,
      ),
      child: IconButton(
        icon: Icon(icon),
        color: Colors.white70,
        onPressed: disabled ? () {} : onTap as void Function()?,
      ),
    );
  }

  Widget _name() {
    return Expanded(
        child: Center(
            child: Padding(
      padding: EdgeInsets.all(ThemeConsts.S_PAD),
      child: Text(text),
    )));
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
        color: Colors.black12,
      ),
      child: Row(
        children: [
          _reduce(),
          _name(),
          _add(),
        ],
      ),
    );
  }
}
