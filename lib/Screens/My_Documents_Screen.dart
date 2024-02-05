import 'package:edumarshals/Widget/My_Document_View_Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyDocument extends StatefulWidget {
  const MyDocument({Key? key}) : super(key: key);

  @override
  State<MyDocument> createState() => _MyDocumentState();
}

class _MyDocumentState extends State<MyDocument> {
  List<String> items = [
    "My Document",
    "Upload/Update Document",
  ];

  List<List<Widget>> cards = [
    [
      My_Document_View_Card(
        documentname: "Aadhar Card 1",
        textbuttonname: 'View',
      ),
      My_Document_View_Card(
        documentname: "Graduation/Diploma Marksheet",
        textbuttonname: 'View',
      ),
      My_Document_View_Card(
        documentname: "Aadhar Card 1",
        textbuttonname: 'View',
      ),
      My_Document_View_Card(
        documentname: "Graduation/Diploma Marksheet",
        textbuttonname: 'View',
      ),
      My_Document_View_Card(
        documentname: "Aadhar Card 1",
        textbuttonname: 'View',
      ),
      My_Document_View_Card(
        documentname: "Graduation/Diploma Marksheet",
        textbuttonname: 'View',
      ),
      My_Document_View_Card(
        documentname: "Aadhar Card 1",
        textbuttonname: 'View',
      ),
      My_Document_View_Card(
        documentname: "Graduation/Diploma Marksheet",
        textbuttonname: 'View',
      ),
      My_Document_View_Card(
        documentname: "Aadhar Card 1",
        textbuttonname: 'View',
      ),
      My_Document_View_Card(
        documentname: "Graduation/Diploma Marksheet",
        textbuttonname: 'View',
      ),
      My_Document_View_Card(
        documentname: "Aadhar Card 1",
        textbuttonname: 'View',
      ),
      My_Document_View_Card(
        documentname: "Graduation/Diploma Marksheet",
        textbuttonname: 'View',
      ),
      My_Document_View_Card(
        documentname: "Aadhar Card 1",
        textbuttonname: 'View',
      ),
      My_Document_View_Card(
        documentname: "Graduation/Diploma Marksheet",
        textbuttonname: 'View',
      ),
      My_Document_View_Card(
        documentname: "Aadhar Card 1",
        textbuttonname: 'View',
      ),
      My_Document_View_Card(
        documentname: "Graduation/Diploma Marksheet",
        textbuttonname: 'View',
      ),
    ],
    [
      My_Document_View_Card(
        documentname: "10th Marksheet",
        textbuttonname: 'Upload',
      ),
      My_Document_View_Card(
        documentname: "Passport ",
        textbuttonname: 'Upload',
      ),
    ],
  ];
  int current = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 243, 255, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,

        toolbarHeight: 100.0, // Adjust the height as needed
        title: const Center(
          child: const Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/assets/Ellipse 7.jpg'),
                backgroundColor: Color.fromARGB(255, 17, 37, 218),
              ),
              Text("Vidhi Gupta"),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          // height: double.infinity,
          margin: const EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                  child: Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                  const Text(
                    "My Documents",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],
              )),

              /// Tab Bar
              SizedBox(
                width: double.infinity,
                height: 80,
                child: ListView.builder(
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
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.all(5),
                              width: screenwidth * 0.45,
                              height: 55,
                              decoration: BoxDecoration(
                                color: current == index
                                    ? const Color.fromRGBO(0, 88, 214, 1)
                                    : const Color.fromRGBO(255, 255, 255, 1),
                                borderRadius: current == index
                                    ? BorderRadius.circular(12)
                                    : BorderRadius.circular(7),
                                border: current == index
                                    ? Border.all(
                                        color:
                                            const Color.fromRGBO(0, 88, 214, 1),
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
                                                0, 88, 214, 1),
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
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  // margin: const EdgeInsets.only(top: 30),
                  width: double.infinity,
                  height: screenHeight * 6,
                  child: PageView.builder(
                    itemCount: cards.length,
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListView(
                        children: cards[current],
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
