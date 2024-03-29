import 'package:daily_todo/data/models/personal_task.dart';
import 'package:daily_todo/repositories/task_repository.dart';
import 'package:flutter/foundation.dart';

class PersonalTaskProvider extends ChangeNotifier {
  final TaskRepository taskRepository;

  PersonalTaskProvider({
    required this.taskRepository,
  }) {
    load();
  }

  List<PersonalTask> personalTasks = [];
  bool isLoading = true;

  void _addPersonalTask(PersonalTask personalTask) {
    !personalTasks.contains(personalTask)
        ? personalTasks.add(personalTask)
        : null;
    notifyListeners();
  }

  Future<void> addPersonalTask(
      {required String title, required String description}) async {
    taskRepository.add(title, description).then((value) {
      value == null ? null : _addPersonalTask(value);
    });
    // notifyListeners();
  }

  void removePersonalTask(String id) {
    personalTasks.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void complete(String id) async {
    PersonalTask task = personalTasks.firstWhere((element) => element.id == id);
    if (task.isCompleted == false) {
      task = await taskRepository.update(id: id, isCompleted: true);

      personalTasks = personalTasks.map((e) => e.id == id ? task : e).toList();

      notifyListeners();
    }
  }

  void delete(String id) async {
    PersonalTask task = personalTasks.firstWhere((element) => element.id == id);

    // task = await taskRepository.delete(id: id);
    task = await taskRepository.delete(id: id);

    personalTasks = personalTasks..removeWhere((element) => element.id == id);

    notifyListeners();
  }

  void notComplete(String id) async {
    PersonalTask task = personalTasks.firstWhere((element) => element.id == id);
    if (task.isCompleted == true) {
      task = await taskRepository.update(id: id, isCompleted: false);

      personalTasks = personalTasks.map((e) => e.id == id ? task : e).toList();

      notifyListeners();
    }
  }
  
  void load() {
    taskRepository.get().then((value) {
      personalTasks = value;
      isLoading = false;
      notifyListeners();
    });
  }
}
