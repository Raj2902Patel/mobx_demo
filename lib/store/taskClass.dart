import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'taskClass.g.dart';

class Task = _Task with _$Task;

abstract class _Task with Store {
  ObservableList<String> tasks = ObservableList<String>();

  @action
  void addTask(String task) {
    tasks.add(task);
    saveTasks();
  }

  @action
  void removeTask(int index) {
    tasks.removeAt(index);
    saveTasks();
  }

  @action
  void updateTask(int index, String updatedTask) {
    if (index >= 0 && index < tasks.length) {
      tasks[index] = updatedTask;
      saveTasks();
    }
  }

  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = jsonEncode(tasks);
    prefs.setString('tasks', tasksJson);
  }

  @action
  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = prefs.getString('tasks');
    if (tasksJson != null) {
      final List<dynamic> loadedTasks = jsonDecode(tasksJson);
      tasks = ObservableList<String>.of(loadedTasks.cast<String>());
    }
  }
}
