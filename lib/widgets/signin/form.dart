import 'package:flutter/material.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';

import 'package:whisqr_puncher/consts/theme.dart';

class SigninFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeConsts.XXL_PAD,
        vertical: ThemeConsts.XL_PAD,
      ),
      child: Column(
        children: [
          BodyText2('Welcome Back!'),
          TextField(
            decoration: InputDecoration(
              hintText: 'Email',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),
          BodyText2('Forgot Password?'),
        ],
      ),
    );
  }
}
