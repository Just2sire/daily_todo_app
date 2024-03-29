import 'package:daily_todo/data/models/personal_task.dart';

abstract class TaskRepository {
  Future<PersonalTask?> add(String title, String description);
  Future<List<PersonalTask>> get();
  Future<PersonalTask> update({required String id, String? title, String? description, bool? isCompleted});
  Future<PersonalTask> delete({required String id});
}
