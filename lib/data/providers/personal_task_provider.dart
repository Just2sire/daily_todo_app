import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_todo/data/models/personal_task.dart';
import 'package:daily_todo/utils/tasks.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class PersonalTaskProvider extends ChangeNotifier {
  List<PersonalTask> personalTasks = [];

  void _addPersonalTask(PersonalTask personalTask) {
    !personalTasks.contains(personalTask)
        ? personalTasks.add(personalTask)
        : null;
    notifyListeners();
  }

  Future<void> addPersonalTask(
      {required String title, required String description}) async {
    PersonalTask personalTask = PersonalTask(
      id: generateFireStoreID(),
      title: title,
      description: description,
    );

    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');

    DocumentReference usersDocument =
        usersCollection.doc(FirebaseAuth.instance.currentUser!.uid);

    CollectionReference personalTaskCollection =
        usersDocument.collection("personal_tasks");

    DocumentReference taskDocument =
        personalTaskCollection.doc(personalTask.id);

    taskDocument.set(personalTask.toJson());

    _addPersonalTask(personalTask);
    // notifyListeners();
  }

  void removePersonalTask(String id) {
    personalTasks.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void complete(String id) {
    PersonalTask task = personalTasks.firstWhere((element) => element.id == id);
    if (task.isCompleted == false) {
      task = task.copyWith(isCompleted: true);
      removePersonalTask(id);
      _addPersonalTask(task);
      notifyListeners();
    }
  }

  void notComplete(String id) {
    PersonalTask task = personalTasks.firstWhere((element) => element.id == id);
    if (task.isCompleted == true) {
      task = task.copyWith(isCompleted: false);
      removePersonalTask(id);
      _addPersonalTask(task);
      notifyListeners();
    }
  }
}
