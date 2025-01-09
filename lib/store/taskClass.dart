import 'package:mobx/mobx.dart';

part 'taskClass.g.dart';

class Task = _Task with _$Task;

abstract class _Task with Store {
  ObservableList<String> tasks = ObservableList<String>();

  @action
  void addTask(String task) {
    tasks.add(task);
  }

  @action
  void removeTask(int index) {
    tasks.removeAt(index);
  }
}
