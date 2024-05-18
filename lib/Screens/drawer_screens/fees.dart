import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:edumarshals/Utils/Utilities/custom_heading.dart';
import 'package:edumarshals/Utils/custom_textfield.dart';
import 'package:edumarshals/Widget/CustomAppBar.dart';
import 'package:edumarshals/main.dart';
import 'package:expandable_section/expandable_section.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class feesPage extends StatefulWidget {
  const feesPage({super.key});

  @override
  State<feesPage> createState() => _feesPageState();
}

bool _isExpandNormal = false;
bool _isExpandFeeWaiver = false;
bool _isExpandLateralEntry = false;
bool _isExpandMCA = false;
bool _isExpandFeePayment = true;
bool _isExpandHostelFeePayment = false;
bool _isExpandOfflinePaymentHistory = false;
final _paymentDateController = TextEditingController();
final _endDateController = TextEditingController();
final _paymentModeController = TextEditingController();
final _addNoController = TextEditingController();
final _accountHolderController = TextEditingController();
final _feeCollectionController = TextEditingController();
final _remarksController = TextEditingController();

class _feesPageState extends State<feesPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Color(0xffF2F6FF),
      appBar: CustomAppBar(
        userName: PreferencesManager().name,
        userImage: PreferencesManager().studentPhoto,
        onTap: () {},
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ButtonsTabBar(
                  height: screenHeight * 0.1,
                  buttonMargin: EdgeInsets.all(10),
                  contentPadding: EdgeInsets.all(12),
                  backgroundColor: Color(0xff004BB8),
                  unselectedBackgroundColor: Colors.white,
                  unselectedLabelStyle: TextStyle(color: Colors.black),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth *
                        0.04, // Adjusted font size using screenWidth
                  ),
                  tabs: [
                    Tab(
                      text: "Fee Structure",
                    ),
                    Tab(
                      text: "Pay Online",
                    ),
                    Tab(
                      text: "Payment History",
                    ),
                    Tab(
                      text: "Offline Payment History",
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      _buildFeeStructure(),
                      _buildPayOnline(),
                      _buildPaymentHistory(),
                      _buildOfflineHistory(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeeStructure() {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  color: Color(0xff004BB8),
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: _isExpandNormal
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )
                      : BorderRadius.circular(10)),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpandNormal = !_isExpandNormal;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 8,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "B.Tech 2nd to 4th (2023 -24)",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Icon(
                            _isExpandNormal
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  ExpandableSection(
                    expand: _isExpandNormal,
                    child: Container(
                      height: screenHeight * 0.3,
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 2),
                      decoration: const BoxDecoration(
                        color: Color(0xffF2F6FF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          child: Image.asset('asset/images/fee.png')),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  color: Color(0xff004BB8),
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: _isExpandFeeWaiver
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )
                      : BorderRadius.circular(10)),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpandFeeWaiver = !_isExpandFeeWaiver;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 8,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "B.Tech 2nd to 4th(FW)(2023 -24)",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Icon(
                            _isExpandFeeWaiver
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  ExpandableSection(
                    expand: _isExpandFeeWaiver,
                    child: Container(
                      height: screenHeight * 0.3,
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 2),
                      decoration: const BoxDecoration(
                        color: Color(0xffF2F6FF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          child: Image.asset('asset/images/fee.png')),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  color: Color(0xff004BB8),
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: _isExpandLateralEntry
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )
                      : BorderRadius.circular(10)),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpandLateralEntry = !_isExpandLateralEntry;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 8,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "B.Tech 2nd to 4th(LE) (2023 -24)",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Icon(
                            _isExpandLateralEntry
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  ExpandableSection(
                    expand: _isExpandLateralEntry,
                    child: Container(
                      height: screenHeight * 0.3,
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 2),
                      decoration: const BoxDecoration(
                        color: Color(0xffF2F6FF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          child: Image.asset('asset/images/fee.png')),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  color: Color(0xff004BB8),
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: _isExpandMCA
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )
                      : BorderRadius.circular(10)),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpandMCA = !_isExpandMCA;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 8,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "MCA 2nd year (2023 -24)",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Icon(
                            _isExpandMCA
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  ExpandableSection(
                    expand: _isExpandMCA,
                    child: Container(
                      height: screenHeight * 0.3,
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 2),
                      decoration: const BoxDecoration(
                        color: Color(0xffF2F6FF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          child: Image.asset('asset/images/fee.png')),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPayOnline() {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Card(
            color: Colors.white,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Important Note: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth *
                            0.04), // Adjusted font size using screenWidth
                  ),
                  Text(
                      '1. Current Year (2023-23) Academic fees is visible here'),
                  Text('2. Help Manual is attached for your reference'),
                  Text(
                      '3. Incase you make payment and you do not get the receipt due to net connectivity, kindly wait for 24 hours for automatically Re- generation of reciept.'),
                  Text('4. For UPI payments kindly check your payment limits'),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        customHeading(heading: 'Collection Name', subHeading: 'College Fee'),
        customHeading(heading: 'Amount', subHeading: '120056'),
        SizedBox(
          height: screenHeight * 0.1,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.white),
              backgroundColor: MaterialStatePropertyAll(Color(0xff004BB8)),
            ),
            onPressed: () {},
            child: Text('Pay',
                style: TextStyle(
                    fontSize: screenWidth *
                        0.04)), // Adjusted font size using screenWidth
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentHistory() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  color: Color(0xff004BB8),
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: _isExpandFeePayment
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )
                      : BorderRadius.circular(10)),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpandFeePayment = !_isExpandFeePayment;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 8,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Fee Payment",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Icon(
                            _isExpandFeePayment
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  ExpandableSection(
                    expand: _isExpandFeePayment,
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 2),
                      decoration: const BoxDecoration(
                        color: Color(0xffF2F6FF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          child: Column(
                            children: [
                              customHeading(
                                  heading: 'Fee Submission Date',
                                  subHeading: 'Fri 1 sep 2023'),
                              customHeading(
                                  heading: 'Fees Paid', subHeading: '120056'),
                              customHeading(
                                  heading: 'Collection name',
                                  subHeading: '2nd Year Academic fee 2023-24'),
                              customHeading(
                                  heading: 'Payment Mode',
                                  subHeading: 'Online'),
                              customHeading(
                                  heading: 'Payment note',
                                  subHeading: '1100181796164'),
                              SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.white),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color(0xff004BB8))),
                                      onPressed: () {},
                                      child: Text('Print')))
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  color: Color(0xff004BB8),
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: _isExpandHostelFeePayment
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )
                      : BorderRadius.circular(10)),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpandHostelFeePayment = !_isExpandHostelFeePayment;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 8,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Hostel Fee Payment",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Icon(
                            _isExpandHostelFeePayment
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  ExpandableSection(
                    expand: _isExpandHostelFeePayment,
                    child: Container(
                      // height: screenHeight * 0.3,
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 2),
                      decoration: const BoxDecoration(
                        color: Color(0xffF2F6FF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          child: Column(
                            children: [
                              customHeading(
                                  heading: 'Fee Submission Date',
                                  subHeading: 'Fri 1 sep 2023'),
                              customHeading(
                                  heading: 'Fees Paid', subHeading: '120056'),
                              customHeading(
                                  heading: 'Collection name',
                                  subHeading: '2nd Year Academic fee 2023-24'),
                              customHeading(
                                  heading: 'Payment Mode',
                                  subHeading: 'Online'),
                              customHeading(
                                  heading: 'Payment note',
                                  subHeading: '1100181796164'),
                              SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.white),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color(0xff004BB8))),
                                      onPressed: () {},
                                      child: Text('Print')))
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOfflineHistory() {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

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

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.025,
        vertical: screenHeight * 0.01,
      ),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: Color(0xff004BB8),
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: _isExpandOfflinePaymentHistory
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
                        _isExpandOfflinePaymentHistory =
                            !_isExpandOfflinePaymentHistory;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.025,
                        vertical: screenHeight * 0.01,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 1,
                          ),
                          const Text(
                            "Offline Payment",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Icon(
                            _isExpandOfflinePaymentHistory
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  ExpandableSection(
                    expand: _isExpandOfflinePaymentHistory,
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 2),
                      decoration: const BoxDecoration(
                        color: Color(0xffF2F6FF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: screenHeight * 0.09,
                                  width: screenWidth * 0.45,
                                  child: customTextFormField(
                                    controller: _paymentModeController,
                                    text: 'Payment Mode',
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.09,
                                  width: screenWidth * 0.45,
                                  child: customTextFormField(
                                    controller: _addNoController,
                                    text: 'Admission No.',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.09,
                              width: screenWidth * 0.9,
                              child: customTextFormField(
                                controller: _accountHolderController,
                                text: 'Account Holder Name',
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: screenHeight * 0.09,
                                  width: screenWidth * 0.45,
                                  child: customTextFormField(
                                    controller: _feeCollectionController,
                                    text: 'Fee Collection',
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.09,
                                  width: screenWidth * 0.45,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      readOnly: true,
                                      controller: _paymentDateController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        labelText: 'Payment Date',
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.calendar_today),
                                          onPressed: () {
                                            _selectDate(
                                              context,
                                              _paymentDateController,
                                            );
                                          },
                                        ), // Add a calendar icon
                                      ),
                                      onTap: () {
                                        _selectDate(
                                          context,
                                          _paymentDateController,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.09,
                              width: screenWidth * 0.9,
                              child: customTextFormField(
                                controller: _remarksController,
                                text: 'Remarks',
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Attachments (5MB max)',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
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
                                width: screenWidth * 0.4,
                                child: Center(child: Text('No File attached')),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.4,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text('Cancel'),
                                    style: ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      backgroundColor: MaterialStatePropertyAll(
                                        Color(0xffF75757),
                                      ),
                                      foregroundColor: MaterialStatePropertyAll(
                                        Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.4,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text('Save'),
                                    style: ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      backgroundColor: MaterialStatePropertyAll(
                                        Color(0xff004BB8),
                                      ),
                                      foregroundColor: MaterialStatePropertyAll(
                                        Colors.white,
                                      ),
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
            SizedBox(
              height: screenHeight * 0.02,
            ),
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
}
