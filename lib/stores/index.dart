import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whisqr_puncher/stores/business.dart';

class Stores {
  BusinessStore business(BuildContext context, [bool listen = false]) =>
      Provider.of<BusinessStore>(context, listen: listen);
}

final Stores stores = Stores();
