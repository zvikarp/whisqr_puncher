import 'package:mobx/mobx.dart';

import 'package:whisqr_puncher/models/customer.dart';

part 'customer.g.dart';

class CustomerStore = _CustomerStore with _$CustomerStore;

abstract class _CustomerStore with Store {
  @observable
  Observable<Customer>? _customer;

  @action
  void setCustomer(Customer customer) {
    _customer = Observable(Customer.clone(customer));
  }

  @computed
  Customer? get customer => _customer?.value;
}
