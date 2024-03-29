import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_todo/data/models/personal_task.dart';
import 'package:daily_todo/repositories/task_repository.dart';
import 'package:daily_todo/utils/tasks.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreTaskRepository extends TaskRepository {
  @override
  Future<PersonalTask?> add(String title, String description) async {
    PersonalTask personalTask = PersonalTask(
      id: generateFireStoreID(),
      title: title,
      description: description,
    );

    try {
      CollectionReference personalTaskCollection = getCollection();

      DocumentReference taskDocument =
          personalTaskCollection.doc(personalTask.id);

      taskDocument.set(personalTask.toMap());

      return personalTask;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<PersonalTask>> get() async {
    CollectionReference personalTaskCollection = getCollection();

    final tasks = await personalTaskCollection.get();

    final tasksDocs = tasks.docs;

    return tasksDocs
        .map((e) => PersonalTask.fromMap(e.data() as Map<String, dynamic>))
        .toList();
  }

  Future<void> loadData() async {}

  CollectionReference getCollection() {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');

    DocumentReference usersDocument =
        usersCollection.doc(FirebaseAuth.instance.currentUser!.uid);

    CollectionReference personalTaskCollection =
        usersDocument.collection("personal_tasks");

    return personalTaskCollection;
  }

  // @override
  Future<PersonalTask> _update({
    required String id,
    String? title,
    String? description,
    bool? isCompleted,
  }) async {
    final List<PersonalTask> tasks = await get();

    PersonalTask task = tasks.where((element) => element.id == id).first;

    task = task.copyWith(
        title: title ?? task.title,
        description: description ?? task.description,
        isCompleted: isCompleted ?? task.isCompleted);

    await getCollection().doc(id).update(task.toMap());

    return task;
  }

  @override
  Future<PersonalTask> update({
    required String id,
    String? title,
    String? description,
    bool? isCompleted,
  }) async {
    final QuerySnapshot querySnapshot =
        await getCollection().where("id", isEqualTo: id).get();

    final doc = querySnapshot.docs.first;

    PersonalTask task = PersonalTask.fromMap(doc.data() as Map<String, dynamic>)
      .copyWith(
        title: title,
        description: description,
        isCompleted: isCompleted,
      );

    doc.reference.update(task.toMap());

    return task;
  }

  @override
  Future<PersonalTask> delete({required String id}) async {
    final List<PersonalTask> tasks = await get();

    PersonalTask task = tasks.where((element) => element.id == id).first;

    await getCollection().doc(id).delete();

    return task;
  }
}

class LocalTaskRepository extends TaskRepository {
  List<PersonalTask> personalTasks = [];

  @override
  Future<PersonalTask?> add(String title, String description) async {
    PersonalTask personalTask = PersonalTask(
      id: generateFireStoreID(),
      title: title,
      description: description,
    );

    personalTasks.add(personalTask);

    return personalTask;
  }

  @override
  Future<List<PersonalTask>> get() async {
    return personalTasks;
  }

  @override
  Future<PersonalTask> update({
    required String id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    PersonalTask task = personalTasks.firstWhere((element) => element.id == id);
    task = task.copyWith(
      title: title ?? task.title,
      description: description ?? task.description,
      isCompleted: isCompleted ?? task.isCompleted,
    );

    personalTasks = personalTasks.map((e) => e.id == id ? task : e).toList();

    return Future.value(task);
    // return task;
  }

  @override
  Future<PersonalTask> delete({required String id}) {
    PersonalTask task = personalTasks.firstWhere((element) => element.id == id);

    personalTasks.remove(task);

    return Future.value(task);
  }
}
