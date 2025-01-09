import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_demo/store/dataClass.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final Data dataStore = GetIt.instance<Data>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.2),
        toolbarHeight: 70,
        title: const Text("Data Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Observer(builder: (_) {
          if (dataStore.fetchDataStore == null) {
            return const Text("Press The Button To Fetch Data");
          }
          if (dataStore.fetchDataStore!.status == FutureStatus.pending) {
            return const CircularProgressIndicator();
          }
          if (dataStore.fetchDataStore!.status == FutureStatus.fulfilled) {
            return Text(dataStore.fetchDataStore!.value!);
          }
          if (dataStore.fetchDataStore!.status == FutureStatus.rejected) {
            return const Text("Error!");
          }
          return Container();
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dataStore.fetchData();
        },
        child: const Icon(CupertinoIcons.repeat),
      ),
    );
  }
}
