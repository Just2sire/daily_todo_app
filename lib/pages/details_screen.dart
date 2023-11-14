import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:daily_todo/utils/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Map singleTask = {
    'title': "UX/UI Design",
    'description':
        "Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines, Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines, Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines, Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines, Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines, Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines, Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines,Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines, Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines, Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines, Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines, Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines, Pratice how to be better in design in general. Nothing special to say but i just want to write a few more more lines, Pratice how to be better in design in general. Nothing special to say but i just want to write a few more more lines, Pratice how to be better in design in general. Nothing special to say but i just want to write a few more more lines, Pratice how to be better in design in general. Nothing special to say but i just want to write a few more more lines, Pratice how to be better in design in general. Nothing special to say but i just want to write a few more more lines, Pratice how to be better in design in general. Nothing special to say but i just want to write a few more more lines, Pratice how to be better in design in general. Nothing special to say but i just want to write a few more more lines, Pratice how to be better in design in general. Nothing special to say but i just want to write a few more more lines, Pratice how to be better in design in general. Nothing special to say but i just want to write a few more more lines, Pratice how to be better in design in general. Nothing special to say but i just want to write a few more more lines, Pratice how to be better in design in general. Nothing special to say but i just want to write a few more more lines, Pratice how to be better in design in general. Nothing special to say but i just want to write a few more more lines, Pratice how to be better in design in general. Nothing special to say but i just want to write a few more lines",
    'author': "John Doe",
    'created_at': DateTime(2023, 10, 11, 07, 36, 56),
    'isCompleted': true,
  };

  late bool isConnected;

  // Future checkConnection () async {
  //   final connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == connectivityResult.none) {

  //   }
  // };

  // final connectivityResult = await (Connectivity().checkConnectivity());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Details",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              context.navBack();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 30,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xFF9581FF),
          elevation: 0,
        ),
        body: Container(
          color: const Color(0xFFF6F6F6),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: Column(
                  children: [
                    Container(
                      height: context.width * 0.30,
                      decoration: const BoxDecoration(color: Color(0xFF9581FF)),
                    ),
                    Expanded(
                      child: Container(
                        decoration:
                            const BoxDecoration(color: Color(0xFFF6F6F6)),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: context.height * 0.075,
                child: Container(
                  width: context.width * 0.85,
                  height: context.height * 0.14,
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
                          color: Color.fromARGB(255, 170, 155, 243),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(context.width * 0.03),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              singleTask['title'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: context.width * 0.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
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
                                                singleTask['created_at'])
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
                                                singleTask['created_at'])
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
                      Gap(context.width * 0.1),
                      IconButton(
                        onPressed: () {},
                        color: const Color(0xFF9581FF),
                        icon: DecoratedBox(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFF9581FF).withOpacity(0.15)),
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 33,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: context.width * 0.455,
                child: SizedBox(
                  height: context.height * 0.58,
                  width: context.width * 0.84,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        height: context.height * 0.58,
                        width: context.width * 0.84,
                        padding: EdgeInsets.all(context.height * 0.02),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text(
                          "${singleTask['description']}",
                          style: TextStyle(
                            color: const Color(0xFF0F071A).withOpacity(0.4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
