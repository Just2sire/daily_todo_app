import 'package:daily_todo/utils/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PersonalTaskscreen extends StatefulWidget {
  const PersonalTaskscreen({super.key});

  @override
  State<PersonalTaskscreen> createState() => _PersonalTaskscreenState();
}

class _PersonalTaskscreenState extends State<PersonalTaskscreen> {
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
            leading: const Icon(
              Icons.arrow_back_rounded,
              size: 30,
              color: Colors.white,
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
              Container(
                color: const Color(0xFFF6F6F6),
                padding: EdgeInsets.only(
                  left: context.width * 0.05,
                  right: context.width * 0.05,
                  top: context.width * 0.03,
                ),
                height: context.height * 0.95,
                width: context.width * 0.95,
                child: Column(
                  children: [
                    ListView.builder(
                      // scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container(
                          width: context.width * 0.84,
                          height: context.height * 0.18,
                          decoration: const BoxDecoration(
                            // color: Colors.amber,
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                MainAxisAlignment.spaceBetween,
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
                                                  color: const Color(0xFF0F071A)
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
                                                  color: const Color(0xFF0F071A)
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
                      // separatorBuilder: (context, index) =>
                      //     Gap(context.width * 0.02),
                      itemCount: personalTasks.length,
                    ),
                  ],
                ),
              ),
              Container(),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
