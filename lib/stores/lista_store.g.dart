// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaStore on _ListaStoreBase, Store {
  final _$resultadosAtom = Atom(name: '_ListaStoreBase.resultados');

  @override
  ObservableList<String> get resultados {
    _$resultadosAtom.context.enforceReadPolicy(_$resultadosAtom);
    _$resultadosAtom.reportObserved();
    return super.resultados;
  }

  @override
  set resultados(ObservableList<String> value) {
    _$resultadosAtom.context.conditionallyRunInAction(() {
      super.resultados = value;
      _$resultadosAtom.reportChanged();
    }, _$resultadosAtom, name: '${_$resultadosAtom.name}_set');
  }

  final _$_ListaStoreBaseActionController =
      ActionController(name: '_ListaStoreBase');

  @override
  void insert(String item) {
    final _$actionInfo = _$_ListaStoreBaseActionController.startAction();
    try {
      return super.insert(item);
    } finally {
      _$_ListaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'resultados: ${resultados.toString()}';
    return '{$string}';
  }
}
