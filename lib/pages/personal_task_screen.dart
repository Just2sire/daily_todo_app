import 'package:daily_todo/data/models/personal_task.dart';
import 'package:daily_todo/data/providers/personal_task_provider.dart';
import 'package:daily_todo/pages/details_screen.dart';
import 'package:daily_todo/utils/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class PersonalTaskscreen extends StatefulWidget {
  const PersonalTaskscreen({super.key});

  @override
  State<PersonalTaskscreen> createState() => _PersonalTaskscreenState();
}

class _PersonalTaskscreenState extends State<PersonalTaskscreen> {
  

  @override
  Widget build(BuildContext context) {

    final personalTasks = context.watch<PersonalTaskProvider>().personalTasks;

    List<PersonalTask> taskDone =
        personalTasks.where((element) => element.isCompleted == true).toList();

    List<PersonalTask> taskInProgress =
        personalTasks.where((element) => element.isCompleted == false).toList();

    return Material(
      child: DefaultTabController(
        length: 3,
        animationDuration: const Duration(milliseconds: 600),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Personal Tasks",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            leading: IconButton(
              onPressed: () => context.navBack(),
              icon: const Icon(
                Icons.arrow_back_rounded,
                size: 30,
                color: Colors.white,
              ),
            ),
            backgroundColor: const Color(0xFF9581FF),
            bottom: const TabBar(
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  child: Text(
                    "TO DO",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "In Progress",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "Done",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: context.height * 0.03),
                child: ListView.builder(
                  itemCount: personalTasks.length,
                  itemBuilder: (context, index) {
                    final PersonalTask task = personalTasks[index];
                    return GestureDetector(
                      onTap: () => context.navToview(DetailsScreen(
                        task: task,
                      )),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: context.width * 0.04,
                          right: context.width * 0.04,
                          top: index == 0 ? 0 : context.height * 0.03,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Slidable(
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      context.read<PersonalTaskProvider>().notComplete(task.id);
                                    },
                                    label: "Progress",
                                    foregroundColor: const Color(0xFF0F071A)
                                        .withOpacity(0.4),
                                    backgroundColor: const Color(0xFF9581FF)
                                        .withOpacity(0.3),
                                    borderRadius: const BorderRadius.horizontal(
                                      right: Radius.circular(3),
                                    ),
                                  ),
                                  SlidableAction(
                                    onPressed: (context) {
                                      context.read<PersonalTaskProvider>().complete(task.id);
                                    },
                                    label: "Done",
                                    foregroundColor: const Color(0xFF0F071A)
                                        .withOpacity(0.4),
                                    borderRadius: const BorderRadius.horizontal(
                                      right: Radius.circular(3),
                                    ),
                                    backgroundColor: const Color(0xFF0F071A)
                                        .withOpacity(0.1),
                                  ),
                                  SlidableAction(
                                    onPressed: (context) {
                                      context.read<PersonalTaskProvider>().delete(task.id);
                                    },
                                    label: "Delete",
                                    foregroundColor:
                                        const Color.fromARGB(255, 177, 40, 1)
                                            .withOpacity(0.7),
                                    borderRadius: const BorderRadius.horizontal(
                                      right: Radius.circular(3),
                                    ),
                                    backgroundColor:
                                        const Color.fromARGB(255, 183, 3, 42)
                                            .withOpacity(0.7),
                                  ),
                                ],
                              ),
                              child: Container(
                                width: context.width * 0.97,
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
                                      padding:
                                          EdgeInsets.all(context.width * 0.03),
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
                                                        .length >
                                                    40
                                                ? "${personalTasks[index].description.substring(0, 40)}..."
                                                : personalTasks[index]
                                                    .description,
                                            maxLines: 2,
                                            overflow: TextOverflow
                                                .fade, // Ajoutez ceci pour montrer "..." en cas de coupure
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: const Color(0xFF0F071A)
                                                  .withOpacity(0.3),
                                            ),
                                          ),
                                          SizedBox(
                                            width: context.width * 0.75,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  personalTasks[index].author,
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color:
                                                        const Color(0xFF0F071A)
                                                            .withOpacity(0.2),
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
                                                      color: const Color(
                                                              0xFF0F071A)
                                                          .withOpacity(0.2),
                                                    ),
                                                    Gap(context.width * 0.011),
                                                    Text(
                                                      context
                                                          .formatTime(
                                                              personalTasks[
                                                                      index]
                                                                  .createdAt)
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: const Color(
                                                                0xFF0F071A)
                                                            .withOpacity(0.2),
                                                      ),
                                                    ),
                                                    Gap(context.width * 0.035),
                                                    Icon(
                                                      Icons.calendar_month,
                                                      size: 22,
                                                      color: const Color(
                                                              0xFF0F071A)
                                                          .withOpacity(0.2),
                                                    ),
                                                    Gap(context.width * 0.011),
                                                    Text(
                                                      context
                                                          .formatDate(
                                                              personalTasks[
                                                                      index]
                                                                  .createdAt)
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: const Color(
                                                                0xFF0F071A)
                                                            .withOpacity(0.2),
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: context.height * 0.03),
                child: ListView.builder(
                  itemCount: taskInProgress.length,
                  itemBuilder: (context, index) {
                    final PersonalTask task = taskInProgress[index];
                    return GestureDetector(
                      onTap: () => context.navToview(DetailsScreen(
                        task: task,
                      )),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: context.width * 0.04,
                          right: context.width * 0.04,
                          top: index == 0 ? 0 : context.height * 0.03,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Slidable(
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      context
                                          .read<PersonalTaskProvider>()
                                          .complete(task.id);
                                    },
                                    label: "Done",
                                    foregroundColor: const Color(0xFF0F071A)
                                        .withOpacity(0.4),
                                    borderRadius: const BorderRadius.horizontal(
                                      right: Radius.circular(3),
                                    ),
                                    backgroundColor: const Color(0xFF0F071A)
                                        .withOpacity(0.1),
                                  ),
                                ],
                              ),
                              child: Container(
                                width: context.width * 0.97,
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
                                      padding:
                                          EdgeInsets.all(context.width * 0.03),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            taskInProgress[index].title,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            taskInProgress[index]
                                                        .description
                                                        .length >
                                                    40
                                                ? "${taskInProgress[index].description.substring(0, 40)} ..."
                                                : taskInProgress[index]
                                                    .description,
                                            maxLines: 2,
                                            overflow: TextOverflow
                                                .fade, // Ajoutez ceci pour montrer "..." en cas de coupure
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: const Color(0xFF0F071A)
                                                  .withOpacity(0.3),
                                            ),
                                          ),
                                          SizedBox(
                                            width: context.width * 0.75,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  taskInProgress[index].author,
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color:
                                                        const Color(0xFF0F071A)
                                                            .withOpacity(0.2),
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
                                                      color: const Color(
                                                              0xFF0F071A)
                                                          .withOpacity(0.2),
                                                    ),
                                                    Gap(context.width * 0.011),
                                                    Text(
                                                      context
                                                          .formatTime(
                                                              taskInProgress[
                                                                      index]
                                                                  .createdAt)
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: const Color(
                                                                0xFF0F071A)
                                                            .withOpacity(0.2),
                                                      ),
                                                    ),
                                                    Gap(context.width * 0.035),
                                                    Icon(
                                                      Icons.calendar_month,
                                                      size: 22,
                                                      color: const Color(
                                                              0xFF0F071A)
                                                          .withOpacity(0.2),
                                                    ),
                                                    Gap(context.width * 0.011),
                                                    Text(
                                                      context
                                                          .formatDate(
                                                              taskInProgress[
                                                                      index]
                                                                  .createdAt)
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: const Color(
                                                                0xFF0F071A)
                                                            .withOpacity(0.2),
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: context.height * 0.03),
                child: ListView.builder(
                  itemCount: taskDone.length,
                  itemBuilder: (context, index) {
                    final PersonalTask task = taskDone[index];
                    return GestureDetector(
                      onTap: () => context.navToview(DetailsScreen(
                        task: task,
                      )),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: context.width * 0.04,
                          right: context.width * 0.04,
                          top: index == 0 ? 0 : context.height * 0.03,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Slidable(
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      context
                                          .read<PersonalTaskProvider>()
                                          .notComplete(task.id);
                                      // print(taskDone[index].isCompleted);
                                    },
                                    label: "Progress",
                                    foregroundColor: const Color(0xFF0F071A)
                                        .withOpacity(0.4),
                                    backgroundColor: const Color(0xFF9581FF)
                                        .withOpacity(0.3),
                                    borderRadius: const BorderRadius.horizontal(
                                      right: Radius.circular(3),
                                    ),
                                  ),
                                ],
                              ),
                              child: Container(
                                width: context.width * 0.97,
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
                                      padding:
                                          EdgeInsets.all(context.width * 0.03),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            taskDone[index].title,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            taskDone[index].description.length >
                                                    40
                                                ? "${taskDone[index].description.substring(0, 40)} ..."
                                                : taskDone[index].description,
                                            maxLines: 2,
                                            overflow: TextOverflow
                                                .fade, // Ajoutez ceci pour montrer "..." en cas de coupure
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: const Color(0xFF0F071A)
                                                  .withOpacity(0.3),
                                            ),
                                          ),
                                          SizedBox(
                                            width: context.width * 0.75,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  taskDone[index].author,
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color:
                                                        const Color(0xFF0F071A)
                                                            .withOpacity(0.2),
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
                                                      color: const Color(
                                                              0xFF0F071A)
                                                          .withOpacity(0.2),
                                                    ),
                                                    Gap(context.width * 0.011),
                                                    Text(
                                                      context
                                                          .formatTime(
                                                              taskDone[index]
                                                                  .createdAt)
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: const Color(
                                                                0xFF0F071A)
                                                            .withOpacity(0.2),
                                                      ),
                                                    ),
                                                    Gap(context.width * 0.035),
                                                    Icon(
                                                      Icons.calendar_month,
                                                      size: 22,
                                                      color: const Color(
                                                              0xFF0F071A)
                                                          .withOpacity(0.2),
                                                    ),
                                                    Gap(context.width * 0.011),
                                                    Text(
                                                      context
                                                          .formatDate(
                                                              taskDone[index]
                                                                  .createdAt)
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: const Color(
                                                                0xFF0F071A)
                                                            .withOpacity(0.2),
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
