import 'package:flutter/material.dart';

import 'package:whisqr_puncher/widgets/signin/actions.dart';
import 'package:whisqr_puncher/widgets/signin/form.dart';
import 'package:whisqr_puncher/widgets/signin/header.dart';

class SigninScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SigninHeaderWidget(),
            SigninFormWidget(),
            SigninActionsWidget(),
          ],
        ),
      ),
    );
  }
}
