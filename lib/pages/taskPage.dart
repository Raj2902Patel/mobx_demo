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
                    maxLength: 15,
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
                  onPressed: () {
                    if (textController.text.isNotEmpty) {
                      taskStore.addTask(textController.text);
                    }

                    textController.clear();
                  },
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
                return taskStore.tasks.isNotEmpty
                    ? ListView.builder(
                        itemCount: taskStore.tasks.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, bottom: 8.0),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Text(
                                    taskStore.tasks[index],
                                  ),
                                  leading: CircleAvatar(
                                    radius: 25,
                                    child: Text("${index + 1}"),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              final TextEditingController
                                                  editController =
                                                  TextEditingController(
                                                      text: taskStore
                                                          .tasks[index]);
                                              return AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          13.0),
                                                ),
                                                title: const Center(
                                                  child: Text('Update Task'),
                                                ),
                                                content: TextField(
                                                  maxLength: 15,
                                                  controller: editController,
                                                  decoration: InputDecoration(
                                                    hintText: "eg. Learning",
                                                    labelText: "Task",
                                                    labelStyle: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    prefixIcon: const Icon(
                                                        Icons.assignment),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.blueGrey,
                                                        width: 1.2,
                                                      ),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      borderSide:
                                                          const BorderSide(
                                                        width: 1.2,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                actions: [
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor: Colors
                                                          .blue
                                                          .withOpacity(0.3),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(13.0),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor: Colors
                                                          .blue
                                                          .withOpacity(0.3),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(13.0),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      taskStore.updateTask(
                                                          index,
                                                          editController.text);
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'Update',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.edit_calendar_outlined,
                                          color: Colors.green,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          print("INDEX : $index");
                                          taskStore.removeTask(index);
                                        },
                                        icon: const Icon(
                                          CupertinoIcons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Text(
                          "No Data Found!",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
