import 'package:mobx/mobx.dart';

part 'userClass.g.dart';

class User = _User with _$User;

abstract class _User with Store {
  @observable
  String firstName = "Raj";

  @observable
  String lastName = "Patel";

  @computed
  String get fullName => "$firstName $lastName";
}
