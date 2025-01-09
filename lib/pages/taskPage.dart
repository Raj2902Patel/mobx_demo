import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_demo/pages/dataPage.dart';
import 'package:mobx_demo/store/taskClass.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final taskStore = GetIt.instance<Task>();

  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Listen to focus changes
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    // Clean up the focus node when the widget is disposed
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.2),
        toolbarHeight: 70,
        title: const Text("Task Page"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DataPage(),
                  ),
                );
              },
              icon: const Icon(CupertinoIcons.arrow_clockwise),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    focusNode: _focusNode,
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: "eg. Learning",
                      labelText: "Task",
                      labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400),
                      prefixIcon: const Icon(Icons.assignment),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                          color: Colors.blueGrey,
                          width: 1.2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                          width: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _isFocused
                      ? () {
                          if (textController.text.isNotEmpty) {
                            taskStore.addTask(textController.text);
                          }

                          textController.clear();
                        }
                      : () {},
                  icon: Icon(
                    CupertinoIcons.add_circled,
                    size: 40.0,
                    color: _isFocused ? Colors.blueGrey : Colors.grey,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                return ListView.builder(
                  itemCount: taskStore.tasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        taskStore.tasks[index],
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          taskStore.removeTask(index);
                        },
                        icon: const Icon(CupertinoIcons.delete),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
