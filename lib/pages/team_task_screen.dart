import 'package:daily_todo/utils/build_context_extension.dart';
import 'package:daily_todo/utils/tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';

class TeamTaskscreen extends StatefulWidget {
  const TeamTaskscreen({super.key});

  @override
  State<TeamTaskscreen> createState() => _TeamTaskscreenState();
}

class _TeamTaskscreenState extends State<TeamTaskscreen> {
  List<Map> teamTasks = [
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': true,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': false,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': true,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': false,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': false,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': true,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': false,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': false,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': true,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': true,
    },
    {
      'title': "UX/UI Design",
      'description':
          "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
      'author': "John Doe",
      'created_at': DateTime(2023, 10, 11, 07, 36, 56),
      'isCompleted': true,
    },
  ];

  List<Map> taskDone = allTeamTasks
      .where((element) => element["isCompleted"] == true)
      .toList();
  List<Map> taskInProgress = allTeamTasks
      .where((element) => element["isCompleted"] == false)
      .toList();

  @override
  Widget build(BuildContext context) {
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
            backgroundColor: const Color(0xFFFFC804),
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
                  itemCount: taskDone.length,
                  itemBuilder: (context, index) {
                    return Padding(
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
                                    setState(() {
                                      teamTasks[index]['isCompleted'] ==
                                          false;
                                    });
                                    print(teamTasks[index]['isCompleted']);
                                  },
                                  label: "Progress",
                                  foregroundColor:
                                      const Color(0xFF0F071A).withOpacity(0.4),
                                  backgroundColor:
                                      const Color(0xFFFFC804).withOpacity(0.3),
                                  borderRadius: const BorderRadius.horizontal(
                                    right: Radius.circular(3),
                                  ),
                                ),
                                SlidableAction(
                                  onPressed: (context) {
                                    setState(() {
                                      teamTasks[index]['isCompleted'] ==
                                          true;
                                    });
                                    print(teamTasks[index]['isCompleted']);
                                  },
                                  label: "Done",
                                  foregroundColor:
                                      const Color(0xFF0F071A).withOpacity(0.4),
                                  borderRadius: const BorderRadius.horizontal(
                                    right: Radius.circular(3),
                                  ),
                                  backgroundColor:
                                      const Color(0xFF0F071A).withOpacity(0.1),
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
                                      color: Color(0xFFFFC804),
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
                                          teamTasks[index]['title'],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${teamTasks[index]['description'].substring(0, 40)} ...",
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                teamTasks[index]['author'],
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: const Color(0xFF0F071A)
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
                                                    color:
                                                        const Color(0xFF0F071A)
                                                            .withOpacity(0.2),
                                                  ),
                                                  Gap(context.width * 0.011),
                                                  Text(
                                                    context
                                                        .formatTime(
                                                            teamTasks[index]
                                                                ['created_at'])
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
                                                    color:
                                                        const Color(0xFF0F071A)
                                                            .withOpacity(0.2),
                                                  ),
                                                  Gap(context.width * 0.011),
                                                  Text(
                                                    context
                                                        .formatDate(
                                                            teamTasks[index]
                                                                ['created_at'])
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
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: context.height * 0.03),
                child: ListView.builder(
                  itemCount: taskInProgress.length,
                  itemBuilder: (context, index) {
                    return Padding(
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
                                // SlidableAction(
                                //   onPressed: (context) {
                                //     setState(() {
                                //       taskInProgress[index]['isCompleted'] ==
                                //           false;
                                //     });
                                //     print(taskInProgress[index]['isCompleted']);
                                //   },
                                //   label: "Progress",
                                //   foregroundColor:
                                //       const Color(0xFF0F071A).withOpacity(0.4),
                                //   backgroundColor:
                                //       const Color(0xFFFFC804).withOpacity(0.3),
                                //   borderRadius: const BorderRadius.horizontal(
                                //     right: Radius.circular(3),
                                //   ),
                                // ),
                                SlidableAction(
                                  onPressed: (context) {
                                    setState(() {
                                      taskInProgress[index]['isCompleted'] ==
                                          true;
                                    });
                                    print(taskInProgress[index]['isCompleted']);
                                  },
                                  label: "Done",
                                  foregroundColor:
                                      const Color(0xFF0F071A).withOpacity(0.4),
                                  borderRadius: const BorderRadius.horizontal(
                                    right: Radius.circular(3),
                                  ),
                                  backgroundColor:
                                      const Color(0xFF0F071A).withOpacity(0.1),
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
                                      color: Color(0xFFFFC804),
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
                                          taskInProgress[index]['title'],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${taskInProgress[index]['description'].substring(0, 40)} ...",
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                taskInProgress[index]['author'],
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: const Color(0xFF0F071A)
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
                                                    color:
                                                        const Color(0xFF0F071A)
                                                            .withOpacity(0.2),
                                                  ),
                                                  Gap(context.width * 0.011),
                                                  Text(
                                                    context
                                                        .formatTime(
                                                            taskInProgress[
                                                                    index]
                                                                ['created_at'])
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
                                                    color:
                                                        const Color(0xFF0F071A)
                                                            .withOpacity(0.2),
                                                  ),
                                                  Gap(context.width * 0.011),
                                                  Text(
                                                    context
                                                        .formatDate(
                                                            taskInProgress[
                                                                    index]
                                                                ['created_at'])
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
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: context.height * 0.03),
                child: ListView.builder(
                  itemCount: taskInProgress.length,
                  itemBuilder: (context, index) {
                    return Padding(
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
                                    setState(() {
                                      taskDone[index]['isCompleted'] ==
                                          false;
                                    });
                                    print(taskDone[index]['isCompleted']);
                                  },
                                  label: "Progress",
                                  foregroundColor:
                                      const Color(0xFF0F071A).withOpacity(0.4),
                                  backgroundColor:
                                      const Color(0xFFFFC804).withOpacity(0.3),
                                  borderRadius: const BorderRadius.horizontal(
                                    right: Radius.circular(3),
                                  ),
                                ),
                                // SlidableAction(
                                //   onPressed: (context) {
                                //     setState(() {
                                //       taskDone[index]['isCompleted'] ==
                                //           true;
                                //     });
                                //     print(taskDone[index]['isCompleted']);
                                //   },
                                //   label: "Done",
                                //   foregroundColor:
                                //       const Color(0xFF0F071A).withOpacity(0.4),
                                //   borderRadius: const BorderRadius.horizontal(
                                //     right: Radius.circular(3),
                                //   ),
                                //   backgroundColor:
                                //       const Color(0xFF0F071A).withOpacity(0.1),
                                // ),
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
                                      color: Color(0xFFFFC804),
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
                                          taskDone[index]['title'],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${taskDone[index]['description'].substring(0, 40)} ...",
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                taskDone[index]['author'],
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: const Color(0xFF0F071A)
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
                                                    color:
                                                        const Color(0xFF0F071A)
                                                            .withOpacity(0.2),
                                                  ),
                                                  Gap(context.width * 0.011),
                                                  Text(
                                                    context
                                                        .formatTime(
                                                            taskDone[index]
                                                                ['created_at'])
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
                                                    color:
                                                        const Color(0xFF0F071A)
                                                            .withOpacity(0.2),
                                                  ),
                                                  Gap(context.width * 0.011),
                                                  Text(
                                                    context
                                                        .formatDate(
                                                            taskDone[index]
                                                                ['created_at'])
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
