import 'package:mobx/mobx.dart';
part 'lista_store.g.dart';

class ListaStore = _ListaStoreBase with _$ListaStore;

abstract class _ListaStoreBase with Store {
  @observable
  ObservableList<String> resultados = ObservableList<String>().asObservable();

  @action
  void insert(String item) {
    resultados.insert(0, item);
  }
}
