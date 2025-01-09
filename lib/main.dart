import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_demo/pages/counterPage.dart';
import 'package:mobx_demo/store/authClass.dart';
import 'package:mobx_demo/store/counterClass.dart';
import 'package:mobx_demo/store/dataClass.dart';
import 'package:mobx_demo/store/taskClass.dart';

final counter = Counter();
final auth = Auth();

void main() {
  GetIt.instance.registerLazySingleton(() => Task());
  GetIt.instance.registerLazySingleton<Data>(() => Data());

  // final disposer = autorun((_) {
  //   print("Counter Value is: ${counter.count}");
  // });
  //
  // //Increment Value
  // counter.incrementValue();
  // counter.incrementValue();
  //
  // //Decrement Value
  // counter.decrementValue();
  //
  // //Function is Not Calling after disposer
  // disposer();
  // counter.incrementValue();

  //Reaction Disposer
  // reaction(
  //     (_) => counter.count, (value) => print("New Counter Value is: $value"));

  // when((_) => counter.count >= 3, () => print("Counter Value is > 3"));

  Future<void> waitForLogin() async {
    await asyncWhen((_) => auth.isLoggedIn);
    print("User Logged In");
  }

  waitForLogin();
  auth.login();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
    );
  }
}
