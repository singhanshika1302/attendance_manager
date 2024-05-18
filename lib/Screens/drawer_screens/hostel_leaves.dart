// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:edumarshals/Utils/custom_textfield.dart';
import 'package:edumarshals/Widget/CustomAppBar.dart';
import 'package:edumarshals/main.dart';
import 'package:expandable_section/expandable_section.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class hostelLeavePage extends StatefulWidget {
  hostelLeavePage({Key? key}) : super(key: key);

  @override
  _hostelLeavePageState createState() => _hostelLeavePageState();
}

final _startDateController = TextEditingController();
final _endDateController = TextEditingController();
final _reasonController = TextEditingController();
final _remarksController = TextEditingController();
final _placeController = TextEditingController();

class _hostelLeavePageState extends State<hostelLeavePage> {
  bool _isExpand = true;

  @override
  Widget build(BuildContext context) {
     final width = MediaQuery.of(context).size.width;
     final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffF2F6FF),
      appBar: CustomAppBar(userName: PreferencesManager().name, userImage: PreferencesManager().studentPhoto,onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> hostelLeavePage()));
      },),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ButtonsTabBar(
                  height: height*0.08,
                  buttonMargin: EdgeInsets.all(10),
                  contentPadding: EdgeInsets.all(12),
                  backgroundColor: Color(0xff004BB8),
                  unselectedBackgroundColor: Colors.white,
                  unselectedLabelStyle: TextStyle(color: Colors.black),
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                  tabs: [
                    Tab(
                      text: "Apply leaves",
                    ),
                    Tab(
                      text: "Your leaves",
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[_buildApplyLeave(), _buildYourLeaves()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

Widget _buildApplyLeave() {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(
      BuildContext context, TextEditingController _controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _controller.text =
            _selectedDate.toIso8601String(); // Update the text field
      });
    }
  }

  final mediaQuery = MediaQuery.of(context);
  final screenWidth = mediaQuery.size.width;
  final screenHeight = mediaQuery.size.height;

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    width: screenWidth,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: Color(0xff004BB8),
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: _isExpand
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )
                  : BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpand = !_isExpand;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "My Hostel/Room",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Apply leave",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              _isExpand
                                  ? Icons.do_not_disturb_on_outlined
                                  : Icons.add_circle_outline_outlined,
                              color: Colors.white,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                ExpandableSection(
                  expand: _isExpand,
                  child: Container(
                    width: screenWidth, // Use screenWidth here
                    margin: const EdgeInsets.only(top: 2),
                    decoration: const BoxDecoration(
                      color: Color(0xffF2F6FF),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: screenHeight * 0.03), 
                          Row(
                            children: [
                              SizedBox(
                                height: screenHeight * 0.12, 
                                width: screenWidth * 0.45, 
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    readOnly: true,
                                    controller: _startDateController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 2),
                                          borderRadius: BorderRadius.circular(15)),
                                      labelText: 'Start Date',
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.calendar_today),
                                        onPressed: () {
                                          _selectDate(context, _startDateController);
                                        },
                                      ), // Add a calendar icon
                                    ),
                                    onTap: () {
                                      _selectDate(context, _startDateController);
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.12, 
                                width: screenWidth * 0.45, 
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: _endDateController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15)),
                                      labelText: 'End Date',
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.calendar_today),
                                        onPressed: () {
                                          _selectDate(context, _endDateController);
                                        },
                                      ), // Add a calendar icon
                                    ),
                                    onTap: () {
                                      _selectDate(context, _endDateController);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          customTextFormField(controller: _reasonController, text: 'Reason'),
                          customTextFormField(controller: _remarksController, text: 'Remarks'),
                          customTextFormField(controller: _placeController, text: 'Place Of Visiting'),
                          SizedBox(height: screenHeight * 0.02), 
                          Row(
                            children: [
                              Text(
                                'Attachments (5MB max)',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              IconButton(
                                onPressed: () {
                                  pickFile();
                                },
                                icon: Icon(Icons.file_upload_outlined),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              pickFile();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[300],
                              ),
                              height: screenHeight * 0.15, 
                              width: screenWidth * 0.3, 
                              child: Center(child: Text('No File attached')),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02), 
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: screenWidth * 0.3, 
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Cancel'),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(Color(0xffF75757)),
                                    foregroundColor: MaterialStateProperty.all(Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.3, 
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Save'),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(Color(0xff004BB8)),
                                    foregroundColor: MaterialStateProperty.all(Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    ),
  );
}


  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        PlatformFile file = result.files.first;

        // Use the file (for example, print its path)
        print('File picked: ${file.path}');
      } else {
        // User canceled the picker
        print('User canceled the file picker.');
      }
    } catch (e) {
      // Handle any errors that might occur during file picking
      print('Error picking file: $e');
    }
  }

Widget _buildYourLeaves() {
  final mediaQuery = MediaQuery.of(context);
  final screenWidth = mediaQuery.size.width;
  final screenHeight = mediaQuery.size.height;

  return Column(
    children: [
      SizedBox(
        width: screenWidth,
        child: Card(
          color: Colors.white,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1. Reason',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  'Going home for sister\'s wedding',
                  style: TextStyle(color: Colors.grey),
                ),
                Row(
                  children: [
                    Text(
                      'Start date: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('21/07/24'),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'End date: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('26/07/24'),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}


}
