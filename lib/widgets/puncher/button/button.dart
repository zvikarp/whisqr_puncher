import 'package:flutter/material.dart';

import 'package:whisqr_puncher/consts/theme.dart';

class PuncherPunchButtonWidget extends StatelessWidget {
  PuncherPunchButtonWidget({
    @required this.text,
  });

  final String text;

  Widget _reduce() {
    return _button(
      Icons.remove,
      Colors.red,
    );
  }

  Widget _add() {
    return _button(
      Icons.add,
      Colors.green,
    );
  }

  Widget _button(IconData icon, Color color) {
    return Container(
      child: IconButton(
        icon: Icon(icon),
        color: Colors.white70,
        onPressed: () {},
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ThemeConsts.S_RADIUS),
        color: color,
      ),
      padding: EdgeInsets.all(ThemeConsts.S_PAD),
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
