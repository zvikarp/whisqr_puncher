import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';

import 'package:whisqr_puncher/consts/theme.dart';
import 'package:whisqr_puncher/utils/api/index.dart';

class PuncherCustomerInfoWidget extends StatefulWidget {
  PuncherCustomerInfoWidget({
    @required this.cardCode,
  });

  final String cardCode;
  @override
  _PuncherCustomerInfoWidgetState createState() =>
      _PuncherCustomerInfoWidgetState();
}

class _PuncherCustomerInfoWidgetState extends State<PuncherCustomerInfoWidget> {
  int _punchesCount = -1;

  Future<void> _getCustomer() async {
    Response response = await apiUtil.punch.getTotal(widget.cardCode);
    Map<String, dynamic> data = response?.data ?? [];
    if (data['status'] == 'success') {
      int punchesCount = int.parse(data['punchtotal'].toString());
      setState(() => _punchesCount = punchesCount);
    }
  }

  Widget _totalPunches() {
    return Container(
      margin: EdgeInsets.all(ThemeConsts.L_PAD),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(150),
        color: ThemeConsts.PRIMARY_COLOR,
      ),
      child: Center(
        child: _punchesCount >= 0
            ? HeadlineText2(_punchesCount.toString())
            : Container(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getCustomer();
  }

  @override
  Widget build(BuildContext context) {
    return _totalPunches();
  }
}
