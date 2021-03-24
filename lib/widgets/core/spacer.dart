import 'package:flutter/material.dart';

class CoreSpacer extends StatelessWidget {
  const CoreSpacer({
    this.width = 0,
    this.height = 0,
    Key key,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
    );
  }
}
