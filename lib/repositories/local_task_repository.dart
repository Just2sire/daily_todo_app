import 'package:daily_todo/data/models/personal_task.dart';
import 'package:daily_todo/repositories/task_repository.dart';

class LocalTaskRepository implements TaskRepository {
  final List<PersonalTask> _tasks = [];

  @override
  Future<PersonalTask?> add(String title, String description) async {
    final newTask = PersonalTask(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      isCompleted: false,
    );
    _tasks.add(newTask);
    return newTask;
  }

  @override
  Future<List<PersonalTask>> get() async {
    return List.unmodifiable(_tasks);
  }

  @override
  Future<PersonalTask> update({
    required String id,
    String? title,
    String? description,
    bool? isCompleted,
  }) async {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index == -1) {
      throw Exception("Task with id $id not found");
    }

    final existingTask = _tasks[index];
    final updatedTask = existingTask.copyWith(
      title: title ?? existingTask.title,
      description: description ?? existingTask.description,
      isCompleted: isCompleted ?? existingTask.isCompleted,
    );

    _tasks[index] = updatedTask;
    return updatedTask;
  }

  @override
  Future<PersonalTask> delete({required String id}) async {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index == -1) {
      throw Exception("Task with id $id not found");
    }

    final removedTask = _tasks.removeAt(index);
    return removedTask;
  }
}
