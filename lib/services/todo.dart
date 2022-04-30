import 'package:hive/hive.dart';
import 'package:hivetodo/model/task.dart';

class TodoServices {
  late Box<Task> _task;

  Future<void> init() async {
    Hive.registerAdapter<Task>(TaskAdapter());
    _task = await Hive.openBox('task');

    await _task.clear();

    await _task.add(Task('mujju', 'slieep ', false));
    await _task.add(Task('muddu', 'eat ', true));
  }

  List<Task> getTasks(final String username) {
    final task = _task.values.where((element) => element.user == username);
    return task.toList();
  }

  void addTask(final String task, final String username) {
    _task.add(Task(username, task, false));
  }

  Future<void> removeTask(final String task, final String username) async {
    final taskToRemove = _task.values.firstWhere(
        (element) => element.task == task && element.user == username);
    await taskToRemove.delete();
  }

  Future<void> updateTask(final String task, final String username,
      {final bool? completed}) async {
    final taskToEdit = _task.values.firstWhere(
        (element) => element.user == username && element.task == task);
    final index = taskToEdit.key as int;
    await _task.put(
        index, Task(username, task, completed ?? taskToEdit.completed));
  }
}
