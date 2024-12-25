import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
  Future<void> _navigateToAddTask({String? editTaskId}) async {
    // finding task to edit via provided id
    Task? existingTask;
    if (editTaskId != null) {
      try {
        existingTask = taskList.firstWhere((task) => task.id == editTaskId);
      } catch (e) {
        existingTask = null;
      }
    }

    //data passing (edited task or new task)
    final taskData = await showDialog<Task>(
      context: context,
      builder: (BuildContext context) {
        return AddTaskDialogWidget(task: existingTask);
      },
    );

    if (taskData != null) {
      setState(() {
        if (editTaskId != null) {
          // replace old task with edited task
          final index = taskList.indexWhere((task) => task.id == editTaskId);
          if (index != -1) {
            taskList[index] = taskData;
          }
        } else {
          //add new task
          taskList.add(taskData);
        }
      });
    }
  }

  //edit task method
  void editTask(String taskId) {
    print('Edit task with ID: $taskId');
    //pass taskId to formInput for editing
    _navigateToAddTask(editTaskId: taskId);
  }

  //delete task method
  void deleteTask(String taskId) {
    setState(() {
      taskList.removeWhere((task) => task.id == taskId);
    });
    print('Deleted task with ID: $taskId');
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
              child: taskList.isEmpty
                  ? const Center(
                      child: Text(
                        'No task added.',
                        style: TextStyle(
                          fontSize: 20,
                          // color: Color(0xff2E8B57),
                          color: Colors.amber,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: taskList.length,
                      itemBuilder: (context, index) {
                        final task = taskList[index];
                        return TaskWidget(
                          taskId: task.id,
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
                          onEdit: () => editTask(task.id),
                          onDelete: () => deleteTask(task.id),
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
    required this.taskId,
    required this.taskName,
    required this.taskDescription,
    required this.taskCompleted,
    required this.taskDate,
    this.onChanged,
    this.onEdit,
    this.onDelete,
  });

  final String taskId;
  final String taskName;
  final String taskDescription;
  final bool taskCompleted;
  final DateTime taskDate;
  final ValueChanged<bool?>? onChanged;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    // String formattedDate =
    //     "${taskDate.day.toString().padLeft(2, '0')}-${taskDate.month.toString().padLeft(2, '0')}-${taskDate.year}";
    //format the date with the intl package
    String formattedDate = DateFormat('dd-MM-yyyy').format(taskDate);

    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 0,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Slidable(
          key: Key(taskId),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  if (onEdit != null) {
                    onEdit!();
                  }
                },
                backgroundColor: Colors.amber,
                foregroundColor: Colors.white,
                icon: CupertinoIcons.pencil_ellipsis_rectangle,
                label: 'Edit',
              ),
              SlidableAction(
                onPressed: (context) {
                  if (onDelete != null) {
                    onDelete!();
                  }
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: CupertinoIcons.delete,
                label: 'Delete',
              )
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Color(0xff2E8B57),
              // borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      taskName.trim(),
                      style: TextStyle(
                        color: const Color(0xffffffff),
                        fontSize: 18,
                        decoration: taskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        decorationColor: Colors.white,
                        decorationThickness: 2,
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
        ),
      ),
    );
  }
}
