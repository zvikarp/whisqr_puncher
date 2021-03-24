import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:whisqr_puncher/models/user.dart';
import 'package:whisqr_puncher/utils/router.gr.dart';
import 'package:whisqr_puncher/utils/storage.dart';

class SpalshScreen extends StatefulWidget {
  @override
  _SpalshScreenState createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  Future<void> _loadUser() async {
    User user = await storageUtil.getUser();
    if (user.isValid()) {
      AutoRouter.of(context).replace(ScannerScreenRoute());
    } else {
      AutoRouter.of(context).replace(SigninScreenRoute());
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
