// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CustomerStore on _CustomerStore, Store {
  Computed<Customer?>? _$customerComputed;

  @override
  Customer? get customer =>
      (_$customerComputed ??= Computed<Customer?>(() => super.customer,
              name: '_CustomerStore.customer'))
          .value;

  final _$_customerAtom = Atom(name: '_CustomerStore._customer');

  @override
  Observable<Customer>? get _customer {
    _$_customerAtom.reportRead();
    return super._customer;
  }

  @override
  set _customer(Observable<Customer>? value) {
    _$_customerAtom.reportWrite(value, super._customer, () {
      super._customer = value;
    });
  }

  final _$_CustomerStoreActionController =
      ActionController(name: '_CustomerStore');

  @override
  void setCustomer(Customer customer) {
    final _$actionInfo = _$_CustomerStoreActionController.startAction(
        name: '_CustomerStore.setCustomer');
    try {
      return super.setCustomer(customer);
    } finally {
      _$_CustomerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
customer: ${customer}
    ''';
  }
}
