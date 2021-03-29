import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:whisqr_puncher/consts/theme.dart';

import 'package:whisqr_puncher/utils/api/index.dart';
import 'package:whisqr_puncher/widgets/puncher/customerInfo.dart';

import 'package:whisqr_puncher/widgets/puncher/options.dart';

class PuncherScreen extends StatefulWidget {
  PuncherScreen({
    @required this.link,
  });

  final String link;

  @override
  _PuncherScreenState createState() => _PuncherScreenState();
}

class _PuncherScreenState extends State<PuncherScreen> {
  int _punchesCount = -1;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _initPunch();
  }

  Future<void> _initPunch() async {
    Response response =
        await apiUtil.punch.initialize(_getCardCode(widget.link));
    Map<String, dynamic> data = response?.data ?? [];

    if (data['status'] == 'success') {
      int punchesCount = int.parse(data['punchtotal'].toString());
      setState(() => _punchesCount = punchesCount);
    }
    setState(() => _loading = false);
  }

  String _getCardCode(String link) {
    int pos = link.lastIndexOf('/');
    String cardCode = (pos != -1) ? link.substring(pos + 1) : link;
    return cardCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (_loading)
                Padding(
                  padding: const EdgeInsets.all(ThemeConsts.L_PAD),
                  child: Center(child: CircularProgressIndicator()),
                ),
              if (!_loading)
                PuncherCustomerInfoWidget(punchesCount: _punchesCount),
              PuncherOptionsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
