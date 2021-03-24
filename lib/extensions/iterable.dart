import 'dart:core';

import 'package:flutter/material.dart';

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

extension ExtendedWidgetList on List<Widget> {
  /// Insert [widget] between each member of this list
  List<Widget> addBetween(Widget widget) {
    if (this.length > 1) {
      for (var i = this.length - 1; i > 0; i--) this.insert(i, widget);
    }
    return this;
  }
}
