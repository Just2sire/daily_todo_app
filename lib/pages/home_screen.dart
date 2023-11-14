import 'package:daily_todo/pages/personal_task_screen.dart';
import 'package:daily_todo/pages/team_task_screen.dart';
import 'package:daily_todo/utils/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String username = "Just2sire";
  int personalTaskNumber = 12;
  int teamTaskNumber = 8;
  int taskProgess = 65;
  int completedTask = 12;
  int pendingTask = 8;

  void _changeType(bool val1, bool val2) {
    setState(() {
      val1 = true;
      val2 = false;
    });
  }

  bool typePersonal = false;
  bool typeTeam = true;

  List<Map> personalTasks = [
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
      'isCompleted': false,
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
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
        body: myBody(context),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF9581FF),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  padding: EdgeInsets.only(
                    left: context.width * 0.05,
                    right: context.width * 0.05,
                    // top: context.width * 0.03,
                  ),
                  height: context.height * 0.64,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                    color: Color(0xFFF6F6F6),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        const TextField(
                          decoration: InputDecoration(
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
                        // Gap(context.width * 0.018),
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
                                  print("Personal Type choose");
                                  setState(() {
                                    _changeType(typePersonal, typeTeam);
                                    // typeTeam = false;
                                    // typePersonal = true;
                                  });
                                },
                                child: Container(
                                  height: context.height * 0.068,
                                  width: context.width * 0.45,
                                  decoration: BoxDecoration(
                                    color: typePersonal
                                        ? const Color(0xFF9581FF)
                                        : Colors.white,
                                    borderRadius: BorderRadius.horizontal(
                                      left: const Radius.circular(10),
                                      right: typePersonal
                                          ? const Radius.circular(10)
                                          : Radius.zero,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.person_outline,
                                        color: typePersonal
                                            ? Colors.white
                                            : const Color(0xFF9581FF),
                                        size: 27,
                                      ),
                                      Text(
                                        "Personnal",
                                        style: TextStyle(
                                          color: typePersonal
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
                                  print("Type team choose");
                                  setState(() {
                                    _changeType(typeTeam, typePersonal);
                                    // typePersonal = false;
                                    // typeTeam = true;
                                  });
                                },
                                child: Container(
                                  height: context.height * 0.068,
                                  width: context.width * 0.45,
                                  decoration: BoxDecoration(
                                    color: typeTeam
                                        ? const Color(0xFF9581FF)
                                        : Colors.white,
                                    borderRadius: BorderRadius.horizontal(
                                      right: const Radius.circular(10),
                                      left: typeTeam
                                          ? const Radius.circular(10)
                                          : Radius.zero,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.people_outline,
                                        color: typeTeam
                                            ? Colors.white
                                            : const Color(0xFF9581FF),
                                        size: 27,
                                      ),
                                      Text(
                                        "Team",
                                        style: TextStyle(
                                          color: typeTeam
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
                        const TextField(
                          maxLines: 3,
                          decoration: InputDecoration(
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
                          onPressed: () {
                            context.navToview(const HomeScreen());
                          },
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
                            "Login",
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
                );
              },
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
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
                    percent: taskProgess / 100,
                    backgroundColor: Colors.white,
                    center: Text(
                      "$taskProgess%",
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
                          color: const Color(0xFF0F071A).withOpacity(0.3),
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
                          color: const Color(0xFF0F071A).withOpacity(0.3),
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
                              color: const Color(0xFF0F071A).withOpacity(0.3),
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
                                        personalTasks[index]['title'],
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${personalTasks[index]['description'].substring(0, 40)} ...",
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
                                              personalTasks[index]['author'],
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
                                                  color: const Color(0xFF0F071A)
                                                      .withOpacity(0.2),
                                                ),
                                                Gap(context.width * 0.011),
                                                Text(
                                                  context
                                                      .formatTime(
                                                          personalTasks[index]
                                                              ['created_at'])
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color:
                                                        const Color(0xFF0F071A)
                                                            .withOpacity(0.2),
                                                  ),
                                                ),
                                                Gap(context.width * 0.035),
                                                Icon(
                                                  Icons.calendar_month,
                                                  size: 22,
                                                  color: const Color(0xFF0F071A)
                                                      .withOpacity(0.2),
                                                ),
                                                Gap(context.width * 0.011),
                                                Text(
                                                  context
                                                      .formatDate(
                                                          personalTasks[index]
                                                              ['created_at'])
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color:
                                                        const Color(0xFF0F071A)
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
                              color: const Color(0xFF0F071A).withOpacity(0.3),
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
                                        personalTasks[index]['title'],
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${personalTasks[index]['description'].substring(0, 40)} ...",
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
                                              personalTasks[index]['author'],
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
                                                  color: const Color(0xFF0F071A)
                                                      .withOpacity(0.2),
                                                ),
                                                Gap(context.width * 0.011),
                                                Text(
                                                  context
                                                      .formatTime(
                                                          personalTasks[index]
                                                              ['created_at'])
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color:
                                                        const Color(0xFF0F071A)
                                                            .withOpacity(0.2),
                                                  ),
                                                ),
                                                Gap(context.width * 0.035),
                                                Icon(
                                                  Icons.calendar_month,
                                                  size: 22,
                                                  color: const Color(0xFF0F071A)
                                                      .withOpacity(0.2),
                                                ),
                                                Gap(context.width * 0.011),
                                                Text(
                                                  context
                                                      .formatDate(
                                                          personalTasks[index]
                                                              ['created_at'])
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color:
                                                        const Color(0xFF0F071A)
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
