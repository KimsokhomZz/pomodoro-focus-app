import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({super.key});

  final List taskList = [
    ['Coding flutter project', false],
    ['Have lunch', false],
    ['Learning flutter', false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // onPressed: () => showDialog(
        //   context: context,
        //   builder: (context) => AddTaskDialogWidget(),
        //   barrierDismissible: false,
        // ),
        onPressed: () {
          //logic
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xffAFE1AF),
                Color(0xff2E8B57),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(
            CupertinoIcons.add,
            size: 32,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(20),
              color: const Color(0xff2E8B57),
              child: Text(
                taskList[index][0],
              ),
            ),
          );
        },
      ),
    );
  }
}
