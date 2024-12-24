import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus_app_project/models/task.dart';
import 'package:focus_app_project/utils/validator.dart';
import 'package:intl/intl.dart';

class AddTaskDialogWidget extends StatefulWidget {
  final Task? task;
  const AddTaskDialogWidget({super.key, this.task});

  @override
  State<AddTaskDialogWidget> createState() => _AddTaskDialogWidgetState();
}

class _AddTaskDialogWidgetState extends State<AddTaskDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String _taskName = '';
  String _taskDescription = '';
  DateTime? _selectedDate;
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _taskDesController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _taskName = widget.task!.taskName;
      _taskDescription = widget.task!.taskDescription;
      _selectedDate = widget.task!.taskDate;

      _taskNameController.text = _taskName;
      _taskDesController.text = _taskDescription;
      _dateController.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
    } else {
      _taskName = '';
      _taskDescription = '';
    }
  }

  void _onSaveTask() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final String id =
          widget.task?.id ?? uuid.v4(); // reuse ID for task editing
      //test printing stored data
      print(
          'ID: $id, Task Name: $_taskName, Description: $_taskDescription, Date: $_selectedDate');
      Task task = Task(
        id: id,
        taskName: _taskName,
        taskDescription: _taskDescription,
        taskDate: _selectedDate ?? DateTime.now(),
      );
      //close form
      Navigator.pop(context, task);
      //success message
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.task != null
                  ? 'Task was updated successfully!'
                  : 'Task was added successfully!',
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              widget.task != null ? 'EDIT YOUR TASK' : 'ADD YOUR TASK',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _taskNameController,
                    decoration: const InputDecoration(
                      label: Text('Task name'),
                    ),
                    maxLines: 1,
                    validator: textValidator,
                    onSaved: (value) {
                      _taskName = value!.trim();
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _taskDesController,
                    decoration: const InputDecoration(
                      label: Text('Task description'),
                    ),
                    maxLines: 3,
                    validator: (value) {
                      String trimmedValue = value?.trim() ?? '';
                      //if the input was filled
                      if (trimmedValue.isNotEmpty) {
                        if (trimmedValue.length < 5) {
                          return 'Description must be at least 5 characters';
                        }
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _taskDescription = value!.trim();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Due Date',
                prefixIcon: Icon(
                  CupertinoIcons.calendar,
                  size: 24,
                ),
              ),
              controller: _dateController,
              readOnly: true,
              onTap: () async {
                DateTime currentDate = DateTime.now();
                DateTime currentDateWithoutTime = DateTime(
                  currentDate.year,
                  currentDate.month,
                  currentDate.day,
                );

                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate ?? currentDateWithoutTime,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );

                if (selectedDate != null && selectedDate != _selectedDate) {
                  setState(() {
                    _selectedDate = selectedDate;
                    // Show the selected date if available
                    _dateController.text =
                        DateFormat('yyyy-MM-dd').format(_selectedDate!);
                  });
                }
              },
              validator: (value) {
                if (_selectedDate == null) {
                  return 'Please select a date';
                }
                return null;
              },
              //no need cuz everything handle in onTap
              // onSaved: (value) {
              //   _selectedDate = _selectedDate;
              // },
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onSaveTask,
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
