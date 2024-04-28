import 'package:edumarshals/Model/assignment_Model.dart';
import 'package:edumarshals/Widget/CustomAppBar.dart';
import 'package:edumarshals/Widget/Subject_Assignment_Card.dart';
import 'package:edumarshals/main.dart';
import 'package:edumarshals/repository/assignment_Repository.dart';
import 'package:flutter/material.dart';

class Subject_Assignment extends StatefulWidget {
  const Subject_Assignment({Key? key}) : super(key: key);

  @override
  State<Subject_Assignment> createState() => _Subject_AssignmentState();
}

class _Subject_AssignmentState extends State<Subject_Assignment> {
  final AssignmentRepository _repository = AssignmentRepository();

  Future<void> loadAssignments() async {
    try {
      final List<Assignment> assignments = await _repository.fetchAssignments();

      // Print the entire response body
      for (Assignment assignment in assignments) {
        // print('Assignment ID: ${assignment.id}');
        print('Subject: ${assignment.subject?.name}');
        print('Assignment URL: ${assignment.assignment}');
        print('Deadline: ${assignment.deadline}');
        print('Description: ${assignment.description}');
        print('Teacher: ${assignment.teacher?.name}');
        print('---');
      }

      // Clear existing cards
      cards.clear();

      // Iterate through the items and filter assignments for each subject
      for (int i = 0; i < items.length; i++) {
        String subject = items[i];
        List<Subject_Assignment_Card> subjectCards = [];

        // Filter assignments for the current subject
        List<Assignment> subjectAssignments = assignments
            .where((assignment) => assignment.subject?.name == subject)
            .toList();

        // Create Subject_Assignment_Card instances for each assignment
        for (Assignment assignment in subjectAssignments) {
          subjectCards.add(
            Subject_Assignment_Card(
              subjectName: assignment.description ?? "",
              status: "Pending", // You can update this based on assignment status
              assignmentUrl: assignment.assignment != null ? assignment.assignment! : "",
            ),
          );
        }


        // Add the cards for the current subject to the list
        cards.add(subjectCards);
      }

      // Update the UI
      setState(() {});
    } catch (e) {
      // Handle errors
      print('Error loading assignments: $e');
    }
  }

  /// List of Tab Bar Item
  List<String> items = [
    "Mathematics IV",
    "DSTL",
    "Data Structure",
    "Python",
  ];

  /// List of body icon
  List<List<Subject_Assignment_Card>> cards = [];

  int current = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    loadAssignments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 243, 255, 1),
      appBar: CustomAppBar(userName: PreferencesManager().name, 
      userImage: PreferencesManager().studentPhoto,
      onTap: () { 
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Subject_Assignment()));

       },),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(5),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 80,
                child: ListView.builder(
                  // physics: const BouncingScrollPhysics(),
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

                            // Load assignments for the selected subject
                            loadAssignments();
                          },
                          child: Container(
                            // duration: const Duration(milliseconds: 300),
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
                                          : const Color.fromRGBO(0, 75, 184, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SizedBox(
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
