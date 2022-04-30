import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 2)
//extending HiveObject will gives a functionality of getting the key of the object within hive.
class Task extends HiveObject {
  @HiveField(0)
  final String user;
  @HiveField(1)
  final String task;
  @HiveField(2)
  final bool completed;

  Task(this.user, this.task, this.completed);
}
