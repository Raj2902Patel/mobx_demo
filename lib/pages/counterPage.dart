import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_demo/pages/userPage.dart';
import 'package:mobx_demo/store/counterClass.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.2),
        toolbarHeight: 70,
        title: const Text("Counter Page"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserPage(),
                  ),
                );
              },
              icon: const Icon(CupertinoIcons.arrow_clockwise),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ReactionBuilder(
            //   builder: (context) {
            //     return reaction(
            //       (_) => counter.count,
            //       (newCount) {
            //         if (newCount == 3) {
            //           ScaffoldMessenger.of(context).showSnackBar(
            //             SnackBar(
            //               content: Center(
            //                   child: Text(
            //                 "The Value is $newCount",
            //                 style: TextStyle(
            //                   color: Colors.white,
            //                   fontSize: 20.0,
            //                   fontWeight: FontWeight.w500,
            //                 ),
            //               )),
            //             ),
            //           );
            //         }
            //       },
            //     );
            //   },
            //   child: Observer(builder: (_) {
            //     return Text(
            //       "Counter Value is: ${counter.count}",
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 20.0,
            //         fontWeight: FontWeight.w500,
            //       ),
            //     );
            //   }),
            // )

            MultiReactionBuilder(
              builders: [
                ReactionBuilder(
                  builder: (context) => reaction(
                    (_) => counter.count,
                    (newCount) {
                      if (newCount == 4) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(
                              child: Text('The Count Value Is: $newCount'),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                ReactionBuilder(
                  builder: (context) =>
                      reaction((_) => counter.errorMsg, (errorMsg) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Center(
                          child: Text(errorMsg),
                        ),
                      ),
                    );
                  }),
                )
              ],
              child: Observer(
                builder: (_) {
                  return Text(
                    "Counter Value is: ${counter.count}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            onPressed: () {
              counter.incrementValue();
            },
            child: const Icon(CupertinoIcons.add),
          ),
          const SizedBox(
            width: 10.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            onPressed: () {
              counter.decrementValue();
            },
            child: const Icon(CupertinoIcons.minus),
          ),
        ],
      ),
    );
  }
}
