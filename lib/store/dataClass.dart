import 'package:mobx/mobx.dart';

part 'dataClass.g.dart';

class Data = _Data with _$Data;

abstract class _Data with Store {
  @observable
  ObservableFuture<String>? fetchDataStore;

  @action
  Future<void> fetchData() async {
    fetchDataStore = ObservableFuture(_fetchDataFromAPI());
    try {
      await fetchDataStore;
    } catch (error) {
      print(error.toString());
    }
  }

  @action
  Future<String> _fetchDataFromAPI() async {
    await Future.delayed(const Duration(seconds: 2));
    return "Fetched Data From API";
  }
}
