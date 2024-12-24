import 'package:focus_app_project/models/task.dart';

final List<Task> taskList = [
  Task(
    id: uuid.v4(),
    taskName: 'Der leng',
    taskDescription: 'Der leng ng haa',
    taskDate: DateTime.now(),
  ),
  Task(
    id: uuid.v4(),
    taskName: 'Kab Knea',
    taskDescription: 'Kab Knea ng haa',
    taskDate: DateTime.now(),
  ),
  Task(
    id: uuid.v4(),
    taskName: 'Nhae Srey',
    taskDescription: 'Nhae Srey ng haa',
    taskDate: DateTime.now(),
  ),
];
