// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskClass.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Task on _Task, Store {
  late final _$_TaskActionController =
      ActionController(name: '_Task', context: context);

  @override
  void addTask(String task) {
    final _$actionInfo =
        _$_TaskActionController.startAction(name: '_Task.addTask');
    try {
      return super.addTask(task);
    } finally {
      _$_TaskActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTask(int index) {
    final _$actionInfo =
        _$_TaskActionController.startAction(name: '_Task.removeTask');
    try {
      return super.removeTask(index);
    } finally {
      _$_TaskActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
