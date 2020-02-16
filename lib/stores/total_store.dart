import 'package:mobx/mobx.dart';
part 'total_store.g.dart';

class TotalStore = _TotalStoreBase with _$TotalStore;

abstract class _TotalStoreBase with Store {
  @observable
  double total = 0;

  @action
  void add(double a, double b, double c) {
    total = ((c * b) / a);
  }

  @action
  void reset() {
    total = 0.0;
  }
}
