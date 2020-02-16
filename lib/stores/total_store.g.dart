// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TotalStore on _TotalStoreBase, Store {
  final _$totalAtom = Atom(name: '_TotalStoreBase.total');

  @override
  double get total {
    _$totalAtom.context.enforceReadPolicy(_$totalAtom);
    _$totalAtom.reportObserved();
    return super.total;
  }

  @override
  set total(double value) {
    _$totalAtom.context.conditionallyRunInAction(() {
      super.total = value;
      _$totalAtom.reportChanged();
    }, _$totalAtom, name: '${_$totalAtom.name}_set');
  }

  final _$_TotalStoreBaseActionController =
      ActionController(name: '_TotalStoreBase');

  @override
  void add(double a, double b, double c) {
    final _$actionInfo = _$_TotalStoreBaseActionController.startAction();
    try {
      return super.add(a, b, c);
    } finally {
      _$_TotalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$_TotalStoreBaseActionController.startAction();
    try {
      return super.reset();
    } finally {
      _$_TotalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'total: ${total.toString()}';
    return '{$string}';
  }
}
