import 'package:edumarshals/Widget/CustomAppBar.dart';
import 'package:edumarshals/Widget/Subject_Assignment_Card.dart';
import 'package:flutter/material.dart';

class Subject_Assignment extends StatefulWidget {
  const Subject_Assignment({Key? key}) : super(key: key);

  @override
  State<Subject_Assignment> createState() => _Subject_AssignmentState();
}

class _Subject_AssignmentState extends State<Subject_Assignment> {
  /// List of Tab Bar Item
  List<String> items = [
    "Mathematics IV",
    "DSTL",
    "Data Structure",
    "Python",
  ];

  /// List of body icon
  List<List<Subject_Assignment_Card>> cards = [
    [
      const Subject_Assignment_Card(
        subjectName: "Math IV Assignment 1",
        status: "Pending",
      ),
      const Subject_Assignment_Card(
        subjectName: "Math IV Assignment 2",
        status: "Completed",
      ),
      const Subject_Assignment_Card(
        subjectName: "Math IV Assignment 1",
        status: "Pending",
      ),
      const Subject_Assignment_Card(
        subjectName: "Math IV Assignment 2",
        status: "Completed",
      ),
      const Subject_Assignment_Card(
        subjectName: "Math IV Assignment 1",
        status: "Pending",
      ),
      const Subject_Assignment_Card(
        subjectName: "Math IV Assignment 2",
        status: "Completed",
      ),
      const Subject_Assignment_Card(
        subjectName: "Math IV Assignment 1",
        status: "Pending",
      ),
      const Subject_Assignment_Card(
        subjectName: "Math IV Assignment 2",
        status: "Completed",
      ),
      const Subject_Assignment_Card(
        subjectName: "Math IV Assignment 1",
        status: "Pending",
      ),
      const Subject_Assignment_Card(
        subjectName: "Math IV Assignment 2",
        status: "Completed",
      ),
      const Subject_Assignment_Card(
        subjectName: "Math IV Assignment 1",
        status: "Pending",
      ),
      const Subject_Assignment_Card(
        subjectName: "Math IV Assignment 2",
        status: "Completed",
      ),
    ],
    [
      const Subject_Assignment_Card(
        subjectName: "DSTL Assignment 1",
        status: "Pending",
      ),
      const Subject_Assignment_Card(
        subjectName: "DSTL Assignment 2",
        status: "Completed",
      ),
    ],
    [
      const Subject_Assignment_Card(
        subjectName: "Data Structure Assignment 1",
        status: "Pending",
      ),
      const Subject_Assignment_Card(
        subjectName: "Data Structure Assignment 2",
        status: "Completed",
      ),
    ],
    [
      const Subject_Assignment_Card(
        subjectName: "Python Assignment 1",
        status: "Pending",
      ),
      const Subject_Assignment_Card(
        subjectName: "Python Assignment 2",
        status: "Completed",
      ),
    ],
  ];
  int current = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 243, 255, 1),
      appBar: const CustomAppBar(userName: "Vidhi Gupta"),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          // height: double.infinity,
          margin: const EdgeInsets.all(5),
          child: Column(
            children: [
              /// Tab Bar
              SizedBox(
                width: double.infinity,
                height: 80,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: items.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                current = index;
                              });
                              pageController.animateToPage(
                                current,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.ease,
                              );
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.all(5),
                              width: 150,
                              height: 55,
                              decoration: BoxDecoration(
                                color: current == index
                                    ? const Color.fromRGBO(0, 75, 184, 1)
                                    : const Color.fromRGBO(255, 255, 255, 1),
                                borderRadius: current == index
                                    ? BorderRadius.circular(12)
                                    : BorderRadius.circular(7),
                                border: current == index
                                    ? Border.all(
                                        color: const Color.fromRGBO(0, 75, 184, 1),
                                        width: 2.5)
                                    : null,
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      items[index],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: current == index
                                            ? Colors.white
                                            : const Color.fromRGBO(
                                                0, 75, 184, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              // Subject_Assignment_Card(
              //     subjectName: "Statical Technique II", status: "pending"),

              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SizedBox(
                  // margin: const EdgeInsets.only(top: 30),
                  width: double.infinity,
                  height: double.maxFinite,
                  child: PageView.builder(
                    itemCount: cards.length,
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: cards[index],
                      );
                    },
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
