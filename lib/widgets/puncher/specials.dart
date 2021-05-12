import 'package:flutter/material.dart';
import 'package:flutter_text_helpers/flutter_text_helpers.dart';
import 'package:whisqr_puncher/consts/theme.dart';

import 'package:whisqr_puncher/extensions/string.dart';
import 'package:whisqr_puncher/models/behaviour.dart';
import 'package:whisqr_puncher/utils/l18n.dart';
import 'package:whisqr_puncher/widgets/puncher/button/counterButton.dart';
import 'package:whisqr_puncher/extensions/iterable.dart';

class PuncherSpecialsWidget extends StatelessWidget {
  PuncherSpecialsWidget({
    required this.punchCode,
    required this.opportunist,
    required this.customerOpportunist,
    required this.onChangeCustomerSpecials,
  });

  final String punchCode;
  final Behaviour? opportunist;
  final Map customerOpportunist;
  final Function(Map) onChangeCustomerSpecials;

  _onChangeCustomerSpecials(int index, int multiplyer) {
    final List customerSpecials =
        List.from(customerOpportunist['specialslist'] ?? []);
    List<Map<String, dynamic>> _customerSpecials = List.from(customerSpecials);
    if (_customerSpecials.length != specials().length) {
      _customerSpecials = List.generate(specials().length, (_) => {});
    }
    _customerSpecials[index]['count'] =
        (_customerSpecials[index]['count'] ?? 0) + multiplyer;
    customerOpportunist['specialslist'] = _customerSpecials;
    onChangeCustomerSpecials(customerOpportunist);
  }

  List<dynamic> specials() => opportunist?.fields?['speciallist'] ?? [];

  @override
  Widget build(BuildContext context) {
    final List customerSpecials =
        List.from(customerOpportunist['specialslist'] ?? []);

    if (!(opportunist?.active ?? false)) {
      return Container();
    } else if (specials().length < 1) {
      return BodyText2(l18nUtil.t('screen.puncher.no-specials'));
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(ThemeConsts.M_PAD),
          child: HeadlineText4(l18nUtil.t('screen.puncher.specials-tl')),
        ),
        ...specials().mapIndexed(
          (dynamic special, int index) {
            if ((special?['active'] ?? true).toString().parseBool()) {
              String name = special?['specialname'] ?? '?';
              String punches = special?['punches'].toString() ?? '?';
              return PuncherCounterButtonWidget(
                text: l18nUtil.t('screen.puncher.receive-punch-card',
                    {'name': name, 'punches': punches}),
                reduceDisabled: (customerSpecials.length > index
                        ? customerSpecials[index]['count'] ?? 0
                        : 0) <
                    1,
                onTapAdd: () => _onChangeCustomerSpecials(index, 1),
                onTapReduce: () => _onChangeCustomerSpecials(index, -1),
              );
            }
            return Container();
          },
        ).toList(),
      ],
    );
  }
}
