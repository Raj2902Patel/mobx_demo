import 'package:mobx/mobx.dart';

part 'counterClass.g.dart';

class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @observable
  int count = 0;

  @observable
  String errorMsg = "";

  @action
  void incrementValue() {
    if (count < 5) {
      count++;
    } else {
      errorMsg = "Count Value Can't Exceed 5";
    }
  }

  @action
  void decrementValue() {
    if (count <= 0) {
      print("Value is 0 or Less Than 0");
    } else {
      count--;
    }
  }
}
