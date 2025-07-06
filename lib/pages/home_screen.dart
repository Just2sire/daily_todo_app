import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_todo/data/models/personal_task.dart';
import 'package:daily_todo/data/models/task_type.dart';
import 'package:daily_todo/data/providers/personal_task_provider.dart';
import 'package:daily_todo/pages/personal_task_screen.dart';
import 'package:daily_todo/pages/team_task_screen.dart';
import 'package:daily_todo/utils/build_context_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String username = "User x";

  int get personalTaskNumber =>
      context.watch<PersonalTaskProvider>().personalTasks.length;

  int teamTaskNumber = 8;

  int get taskProgress {
    final taskProvider = context.watch<PersonalTaskProvider>();
    final personalTasks = taskProvider.personalTasks;

    // Gère le cas où il n'y a aucune tâche pour éviter une division par zéro
    if (personalTasks.isEmpty) {
      return 0; // Ou une autre valeur par défaut appropriée
    }

    final completedTasksCount =
        personalTasks.where((element) => element.isCompleted).length;

    // Si personalTasks n'est pas vide, personalTasks.length ne sera pas 0 ici.
    // De plus, j'utilise la division standard (/) qui produit un double,
    // puis .round() pour obtenir un entier.
    final progress =
        (completedTasksCount * 100.0 / personalTasks.length).round();

    return progress;
  }

  /*
  int get taskProgess => (context
      .watch<PersonalTaskProvider>()
      .personalTasks
      .where((element) => element.isCompleted == true).length * 100) ~/ context
      .watch<PersonalTaskProvider>()
      .personalTasks.length
      ;
  */

  int get completedTask => context
      .watch<PersonalTaskProvider>()
      .personalTasks
      .where((element) => element.isCompleted == true)
      .length;

  int get pendingTask => context
      .watch<PersonalTaskProvider>()
      .personalTasks
      .where((element) => element.isCompleted == false)
      .length;

  List<PersonalTask> get personalTasks =>
      context.watch<PersonalTaskProvider>().personalTasks;

  @override
  void initState() {
    super.initState();
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');

    DocumentReference usersDocument =
        usersCollection.doc(FirebaseAuth.instance.currentUser!.uid);

    CollectionReference personalTaskCollection =
        usersDocument.collection("personal_tasks");

    personalTaskCollection.snapshots().listen((event) {
      debugPrint(event.docs.length.toString());
      if (!mounted) return;
      context.read<PersonalTaskProvider>().load();
    });
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
      } else {
        debugPrint('User is signed in!');
      }
    });
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFFF6F6F6),
          statusBarBrightness: Brightness.dark,
        ),
        elevation: 0.0,
        backgroundColor: const Color(0xFFF6F6F6),
        leading: Container(
          margin: EdgeInsets.all(context.width * 0.02),
          child: const CircleAvatar(
            backgroundImage: AssetImage("assets/images/user.png"),
          ),
        ),
        title: Text(
          "Welcome back, $username !👋",
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: context.watch<PersonalTaskProvider>().isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : myBody(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF9581FF),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return const BottomModal();
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  SingleChildScrollView myBody(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: const Color(0xFFF6F6F6),
        padding: EdgeInsets.only(
          left: context.width * 0.05,
          right: context.width * 0.05,
          top: context.height * 0.007,
        ),
        child: Column(
          children: [
            Container(
              width: context.width * 99.9,
              height: context.height * 0.20,
              padding: EdgeInsets.symmetric(
                vertical: context.height * 0.02,
                horizontal: context.width * 0.06,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF6854d1),
                    Color(0xFF9581FF),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Pending Tasks",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF6F6F6),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF6F6F6),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Gap(context.width * 0.02),
                          Text(
                            "Personal $personalTaskNumber",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFFF6F6F6),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFC804),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Gap(context.width * 0.02),
                          Text(
                            "Team $teamTaskNumber",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFFF6F6F6),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  CircularPercentIndicator(
                    radius: 50.0,
                    lineWidth: 17.0,
                    percent: taskProgress / 100,
                    backgroundColor: Colors.white,
                    center: Text(
                      "$taskProgress%",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    animation: true,
                    animationDuration: 1000,
                    // animateFromLastPercent: true,
                    progressColor: const Color(0xFFFFC804),
                  ),
                ],
              ),
            ),
            Gap(context.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: context.width * 0.44,
                  padding: EdgeInsets.symmetric(
                    vertical: context.width * 0.02,
                    horizontal: context.width * 0.03,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "$completedTask",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Completed task",
                        style: TextStyle(
                          fontSize: 17,
                          color: const Color(0xFF0F071A).withValues(alpha: 0.3),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: context.width * 0.44,
                  padding: EdgeInsets.symmetric(
                    vertical: context.width * 0.02,
                    horizontal: context.width * 0.03,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "$pendingTask",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Pending task",
                        style: TextStyle(
                          fontSize: 17,
                          color: const Color(0xFF0F071A).withValues(alpha: 0.3),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(context.height * 0.024),
            SizedBox(
              height: context.height * 0.228,
              width: context.width * 0.9,
              child: SizedBox(
                height: context.height * 0.228,
                width: context.width * 0.9,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Personal Tasks",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              context.navToview(const PersonalTaskscreen()),
                          child: Text(
                            "View all",
                            style: TextStyle(
                              fontSize: 13,
                              color: const Color(0xFF0F071A)
                                  .withValues(alpha: 0.3),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(context.height * 0.017),
                    SizedBox(
                      height: context.height * 0.17,
                      width: context.width * 0.99,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: context.width * 0.84,
                            height: context.height * 0.18,
                            decoration: const BoxDecoration(
                              // color: Colors.amber,
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: context.width * 0.022,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF9581FF),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(context.width * 0.03),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        personalTasks[index].title,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        personalTasks[index]
                                                    .description
                                                    .length <
                                                40
                                            ? personalTasks[index].description
                                            : "${personalTasks[index].description.substring(0, 40)} ...",
                                        maxLines: 2,
                                        overflow: TextOverflow
                                            .fade, // Ajoutez ceci pour montrer "..." en cas de coupure
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: const Color(0xFF0F071A)
                                              .withValues(alpha: 0.3),
                                        ),
                                      ),
                                      SizedBox(
                                        width: context.width * 0.75,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              personalTasks[index].author,
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: const Color(0xFF0F071A)
                                                    .withValues(alpha: 0.2),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  Icons.access_time,
                                                  size: 22,
                                                  color: const Color(0xFF0F071A)
                                                      .withValues(alpha: 0.2),
                                                ),
                                                Gap(context.width * 0.011),
                                                Text(
                                                  context
                                                      .formatTime(
                                                          personalTasks[index]
                                                              .createdAt)
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color:
                                                        const Color(0xFF0F071A)
                                                            .withValues(
                                                                alpha: 0.2),
                                                  ),
                                                ),
                                                Gap(context.width * 0.035),
                                                Icon(
                                                  Icons.calendar_month,
                                                  size: 22,
                                                  color: const Color(0xFF0F071A)
                                                      .withValues(alpha: 0.2),
                                                ),
                                                Gap(context.width * 0.011),
                                                Text(
                                                  context
                                                      .formatDate(
                                                          personalTasks[index]
                                                              .createdAt)
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color:
                                                        const Color(0xFF0F071A)
                                                            .withValues(
                                                                alpha: 0.2),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            Gap(context.width * 0.02),
                        itemCount: personalTasks.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(context.height * 0.010),
            SizedBox(
              height: context.height * 0.228,
              width: context.width * 0.9,
              child: SizedBox(
                height: context.height * 0.228,
                width: context.width * 0.9,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Team Tasks",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              context.navToview(const TeamTaskscreen()),
                          child: Text(
                            "View all",
                            style: TextStyle(
                              fontSize: 13,
                              color: const Color(0xFF0F071A)
                                  .withValues(alpha: 0.3),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(context.height * 0.017),
                    SizedBox(
                      height: context.height * 0.17,
                      width: context.width * 0.99,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: context.width * 0.84,
                            height: context.height * 0.18,
                            decoration: const BoxDecoration(
                              // color: Colors.amber,
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: context.width * 0.022,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFC804),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(context.width * 0.03),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        personalTasks[index].title,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        personalTasks[index]
                                                    .description
                                                    .length <
                                                40
                                            ? personalTasks[index].description
                                            : "${personalTasks[index].description.substring(0, 40)} ...",
                                        maxLines: 2,
                                        overflow: TextOverflow
                                            .fade, // Ajoutez ceci pour montrer "..." en cas de coupure
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: const Color(0xFF0F071A)
                                              .withValues(alpha: 0.3),
                                        ),
                                      ),
                                      SizedBox(
                                        width: context.width * 0.75,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              personalTasks[index].author,
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: const Color(0xFF0F071A)
                                                    .withValues(alpha: 0.2),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  Icons.access_time,
                                                  size: 22,
                                                  color: const Color(0xFF0F071A)
                                                      .withValues(alpha: 0.2),
                                                ),
                                                Gap(context.width * 0.011),
                                                Text(
                                                  context
                                                      .formatTime(
                                                        personalTasks[index]
                                                            .createdAt,
                                                      )
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color:
                                                        const Color(0xFF0F071A)
                                                            .withValues(
                                                                alpha: 0.2),
                                                  ),
                                                ),
                                                Gap(context.width * 0.035),
                                                Icon(
                                                  Icons.calendar_month,
                                                  size: 22,
                                                  color: const Color(0xFF0F071A)
                                                      .withValues(alpha: 0.2),
                                                ),
                                                Gap(context.width * 0.011),
                                                Text(
                                                  context
                                                      .formatDate(
                                                        personalTasks[index]
                                                            .createdAt,
                                                      )
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color:
                                                        const Color(0xFF0F071A)
                                                            .withValues(
                                                                alpha: 0.2),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            Gap(context.width * 0.02),
                        itemCount: personalTasks.length,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomModal extends StatefulWidget {
  const BottomModal({super.key});

  @override
  State<BottomModal> createState() => _BottomModalState();
}

class _BottomModalState extends State<BottomModal> {
  TaskType type = TaskType.personal;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      context.read<PersonalTaskProvider>().addPersonalTask(
            title: titleController.text,
            description: descriptionController.text,
          );
      debugPrint("Done");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(milliseconds: 100),
          content: Text("Tache ajouté"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: context.width * 0.05,
        right: context.width * 0.05,
        // top: context.width * 0.03,
      ),
      height: context.height * 0.63,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
        color: Color(0xFFF6F6F6),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(context.height * 0.030),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: context.width * 0.15,
                    height: context.height * 0.01,
                    decoration: const BoxDecoration(
                      color: Color(0xFF9581FF),
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(context.height * 0.005),
              const Divider(
                color: Color(0xffDDDADA),
              ),
              Gap(context.height * 0.015),
              const Text(
                "Title",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(context.height * 0.007),
              TextFormField(
                controller: titleController,
                validator: (value) {
                  if (value!.length < 3 || value.isEmpty) {
                    return "Minimun 3 caractères";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(15),
                  hintText: "Name",
                  hintStyle: TextStyle(
                    height: 2,
                    color: Color(0xffDDDADA),
                    fontSize: 15,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Gap(context.height * 0.007),
              const Text(
                "Type",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(10),
                    right: Radius.circular(10),
                  ),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          type = TaskType.personal;
                        });
                      },
                      child: Container(
                        height: context.height * 0.068,
                        width: context.width * 0.45,
                        decoration: BoxDecoration(
                          color: type == TaskType.personal
                              ? const Color(0xFF9581FF)
                              : Colors.white,
                          borderRadius: BorderRadius.horizontal(
                            left: const Radius.circular(10),
                            right: type == TaskType.personal
                                ? const Radius.circular(10)
                                : Radius.zero,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person_outline,
                              color: type == TaskType.personal
                                  ? Colors.white
                                  : const Color(0xFF9581FF),
                              size: 27,
                            ),
                            Text(
                              "Personnal",
                              style: TextStyle(
                                color: type == TaskType.personal
                                    ? Colors.white
                                    : const Color(0xFF9581FF),
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          type = TaskType.team;
                        });
                      },
                      child: Container(
                        height: context.height * 0.068,
                        width: context.width * 0.45,
                        decoration: BoxDecoration(
                          color: type == TaskType.team
                              ? const Color(0xFF9581FF)
                              : Colors.white,
                          borderRadius: BorderRadius.horizontal(
                            right: const Radius.circular(10),
                            left: type == TaskType.team
                                ? const Radius.circular(10)
                                : Radius.zero,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.people_outline,
                              color: type == TaskType.team
                                  ? Colors.white
                                  : const Color(0xFF9581FF),
                              size: 27,
                            ),
                            Text(
                              "Team",
                              style: TextStyle(
                                color: type == TaskType.team
                                    ? Colors.white
                                    : const Color(0xFF9581FF),
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(context.height * 0.012),
              const Text(
                "Description",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(context.height * 0.007),
              TextFormField(
                controller: descriptionController,
                validator: (value) {
                  if (value!.length < 10 || value.isEmpty) {
                    return "Minimun 10 caractères";
                  }
                  return null;
                },
                maxLines: 3,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(15),
                  hintText: "Name",
                  hintStyle: TextStyle(
                    height: 2,
                    color: Color(0xffDDDADA),
                    fontSize: 15,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Gap(context.height * 0.015),
              ElevatedButton(
                onPressed: _validateForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9581FF),
                  fixedSize: Size(
                    (context.width * 909),
                    (context.height * 0.07),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                child: const Text(
                  "Add",
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFFF6F6F6),
                  ),
                ),
              ),
              Gap(context.height * 0.015),
            ],
          ),
        ),
      ),
    );
  }
}
