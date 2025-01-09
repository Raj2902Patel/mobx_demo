// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dataClass.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Data on _Data, Store {
  late final _$fetchDataStoreAtom =
      Atom(name: '_Data.fetchDataStore', context: context);

  @override
  ObservableFuture<String>? get fetchDataStore {
    _$fetchDataStoreAtom.reportRead();
    return super.fetchDataStore;
  }

  @override
  set fetchDataStore(ObservableFuture<String>? value) {
    _$fetchDataStoreAtom.reportWrite(value, super.fetchDataStore, () {
      super.fetchDataStore = value;
    });
  }

  late final _$fetchDataAsyncAction =
      AsyncAction('_Data.fetchData', context: context);

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  late final _$_fetchDataFromAPIAsyncAction =
      AsyncAction('_Data._fetchDataFromAPI', context: context);

  @override
  Future<String> _fetchDataFromAPI() {
    return _$_fetchDataFromAPIAsyncAction.run(() => super._fetchDataFromAPI());
  }

  @override
  String toString() {
    return '''
fetchDataStore: ${fetchDataStore}
    ''';
  }
}
