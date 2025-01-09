import 'package:mobx/mobx.dart';

part 'authClass.g.dart';

class Auth = _Auth with _$Auth;

abstract class _Auth with Store {
  @observable
  bool isLoggedIn = false;

  @action
  void login() {
    Future.delayed(const Duration(seconds: 2), () {
      isLoggedIn = true;
    });
  }
}
