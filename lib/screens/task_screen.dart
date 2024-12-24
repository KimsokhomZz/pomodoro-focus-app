import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus_app_project/data/task_list.dart';
import 'package:focus_app_project/models/task.dart';
import 'package:focus_app_project/widgets/add_task.dart';
import 'package:intl/intl.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  //go to add new task
  Future<void> _navigateToAddTask({TaskWidget? item}) async {
    final task = await showDialog<Task>(
      context: context,
      // MaterialPageRoute(
      //   builder: (context) => const AddTaskDialogWidget(),
      // ),
      builder: (BuildContext context) {
        return const AddTaskDialogWidget();
      },
    );

    if (task != null) {
      setState(() {
        taskList.add(task);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddTask,
        backgroundColor: const Color(0xff353935),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(
          CupertinoIcons.add,
          size: 32,
          color: Color(0xffffffff),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                Tooltip(
                  message: 'Profile',
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.transparent, // No background color
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      //navigate to profile page
                      print('Navigate to profile page');
                    },
                    child: Image.asset(
                      'assets/icons/profile_icon.png',
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              'TASKS',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Color(0xff353935),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  final task = taskList[index];
                  return TaskWidget(
                    taskName: task.taskName,
                    taskDescription: task.taskDescription,
                    taskCompleted: task.taskCompleted,
                    taskDate: task.taskDate,
                    onChanged: (value) {
                      setState(() {
                        task.taskCompleted = value ?? false;
                        // print('completeTask = true');
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//task widget
class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
    required this.taskName,
    required this.taskDescription,
    required this.taskCompleted,
    required this.taskDate,
    this.onChanged,
  });

  final String taskName;
  final String taskDescription;
  final bool taskCompleted;
  final DateTime taskDate;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    // String formattedDate =
    //     "${taskDate.day.toString().padLeft(2, '0')}-${taskDate.month.toString().padLeft(2, '0')}-${taskDate.year}";
    //format the date with the intl package
    String formattedDate = DateFormat('dd-MM-yyyy').format(taskDate);

    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: 0,
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xff2E8B57),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  taskName.trim(),
                  style: const TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  checkColor: const Color(0xff353935),
                  activeColor: const Color(0xffffffff),
                  side: const BorderSide(
                    color: Color(0xffffffff),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  // taskDescription.trim(),
                  taskDescription.trim().isNotEmpty
                      ? taskDescription.trim()
                      : 'No description available',
                  style: const TextStyle(
                    color: Color(0xffD3D3D3),
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                Text(
                  formattedDate,
                  style: const TextStyle(
                    color: Color(0xffD3D3D3),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
