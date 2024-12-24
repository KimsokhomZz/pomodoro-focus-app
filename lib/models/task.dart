import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Task {
  final String id;
  final String taskName;
  final String taskDescription;
  bool taskCompleted;
  DateTime taskDate;

  Task({
    required this.id,
    required this.taskName,
    required this.taskDescription,
    this.taskCompleted = false, //default value
    required this.taskDate,
  });
}
