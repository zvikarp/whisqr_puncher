import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:whisqr_puncher/models/customer.dart';
import 'package:whisqr_puncher/stores/index.dart';
import 'package:whisqr_puncher/utils/api/index.dart';
import 'package:whisqr_puncher/widgets/puncher/customerInfo.dart';
import 'package:whisqr_puncher/widgets/puncher/options.dart';

class PuncherScreen extends StatefulWidget {
  PuncherScreen({
    required this.link,
  });

  final String? link;

  @override
  _PuncherScreenState createState() => _PuncherScreenState();
}

class _PuncherScreenState extends State<PuncherScreen> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _initPunch();
  }

  Future<void> _initPunch() async {
    Response? response =
        await apiUtil.punch.initialize(_getCardCode(widget.link!));
    Map<String, dynamic> data = response?.data ?? [];

    if (data['status'] == 'success') {
      Customer customer = Customer.fromStringMap(data);
      stores.customer(context).setCustomer(customer);
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
        child: _loading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PuncherCustomerInfoWidget(),
                    PuncherOptionsWidget(),
                  ],
                ),
              ),
      ),
    );
  }
}
