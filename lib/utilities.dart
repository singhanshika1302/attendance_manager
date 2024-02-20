import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  // final String Bold;
  final Color? color;
  final FontStyle? fontStyle;
  final double? fontSize;
  final TextAlign? textAlign;
  final String? fontfamily;

  const CustomText({
    super.key,
    required this.text,
    // this.Bold,
    required this.fontStyle,
    required this.color,
    this.fontSize,
    this.textAlign,
    this.fontfamily,
  });

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    return Text(
      text,
      style: TextStyle(
        // fontFamily: ,
        fontWeight: FontWeight.w500,
        fontFamily: fontfamily,
        color: color ?? Colors.white,
        fontSize: fontSize ?? 10,
        fontStyle: fontStyle ?? FontStyle.normal,
      ),
    );
  }
}

Widget buildtextfiled(String image, String text, BuildContext context,
    String hinttext, bool obscure, controller) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // SizedBox(width: 900),
      Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: CustomText(
          text: text,
          color: const Color(0xFF3386FF),
          fontSize: 12,
          fontStyle: null,
          fontfamily: 'Poppins',
          // fontWeight: FontWeight.w400,
        ),
      ),
      Container(
          decoration: const BoxDecoration(
              // color: Color(0xFFA0A0A0),
              border: Border(
                  // bottom: BorderSide(width: 1, color: Color(0xFFA0A0A0)),
                  )

              // boxShadow: [
              //   BoxShadow(
              //       // color: Color.fromARGB(62, 254, 254, 254).withOpacity(0.2),
              //       // spreadRadius: 2,
              //       // blurRadius: 5,
              //       // offset: const Offset(0, 3),
              //       ),
              // ],
              ),
          // margin: const EdgeInsets.all(8.0),
          child: SizedBox(
            // width: screenWidth * 1,
            child: Row(children: [
              Image.asset(
                image,
                scale: 4.5,
                // height: screenHeight * 0.032,
              ),
              SizedBox(width: screenWidth * 0.01),
              SizedBox(
                width: screenWidth * 0.6,
                child: TextFormField(
                  controller: controller,
                  obscureText: obscure,
                  style: const TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid value';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(0, 17, 90, 216),
                    filled: true,
                    hintText: hinttext,
                    hintStyle: const TextStyle(
                        color: Color(0xFF565656),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                    // border:
                    // focusedBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    //   borderSide: BorderSide(color: Color(0xFFA0A0A0)),
                    // ),
                    // enabledBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(2),
                    //   borderSide: BorderSide.none,
                    // ),
                    // suffixStyle: const TextStyle(color: Colors.indigo),
                  ),
                ),
              ),
            ]),
          ))
    ],
  );
}

Widget button(String text, double height, double width, BuildContext context,
    Future<void> Function() onTapFunction) {
  // final screenHeight = MediaQuery.of(context).size.height;
  // final screenWidth = MediaQuery.of(context).size.width;

  return GestureDetector(
    onTap: () async {
      await onTapFunction();
      // if (context.mounted) {
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      // }
      // onTapFunction();
    },
    child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Color(0xFF4E82EA), Color(0xFF245BC9)],
          ),
          borderRadius: BorderRadius.all(Radius.circular(7)),
          boxShadow: [
            BoxShadow(),
          ],
        ),
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              // height: 0,
            ),
          ),
        )),
  );
}

Widget button3(
    String text, double height, double width, BuildContext context, page) {
  // final screenHeight = MediaQuery.of(context).size.height;
  // final screenWidth = MediaQuery.of(context).size.width;

  return GestureDetector(
    onTap: () async {
      // await onTapFunction();

      Navigator.push(context, MaterialPageRoute(builder: (context) => page));

      // onTapFunction();
    },
    child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Color(0xFF4E82EA), Color(0xFF245BC9)],
          ),
          borderRadius: BorderRadius.all(Radius.circular(7)),
          boxShadow: [
            BoxShadow(),
          ],
        ),
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              // height: 0,
            ),
          ),
        )),
  );
}
  Widget responsiveText(BuildContext context, String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.width * 0.02,
        ),
      ),
    );
  }

Widget UserInput(String text, TextEditingController controller, String text1,
    TextEditingController controller1, BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: screenWidth * 0.45,
          child: TextFormField(
            controller: controller,
            textInputAction: TextInputAction.next,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              labelText: text,
              labelStyle: const TextStyle(
                  color: Color.fromARGB(158, 0, 0, 0),
                  fontSize: 15.9,
                  fontWeight: FontWeight.w500),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 0, 0, 0),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 0, 0, 0),
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 1, 1, 1),
                  width: 1,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: screenWidth * 0.45,
          child: TextFormField(
            controller: controller1,
            textInputAction: TextInputAction.next,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              labelText: text1,
              labelStyle: const TextStyle(
                  color: Color.fromARGB(158, 0, 0, 0),
                  fontSize: 15.9,
                  fontWeight: FontWeight.w500),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 0, 0, 0),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 0, 0, 0),
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 0, 0, 0),
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget UserInput1(
    String text, TextEditingController controller, BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: screenWidth * 0.938,
          child: TextFormField(
            controller: controller,
            textInputAction: TextInputAction.next,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              labelText: text,
              labelStyle: const TextStyle(
                  color: Color.fromARGB(158, 0, 0, 0),
                  fontSize: 15.9,
                  fontWeight: FontWeight.w500),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 0, 0, 0),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 0, 0, 0),
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 1, 1, 1),
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget upper(
    String text, double height, double width, BuildContext context, page) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;

  // return GestureDetector(
  //   onTap: () async {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  //   },
  //   child: Container(
  //       decoration: const BoxDecoration(
  //         gradient: LinearGradient(
  //           begin: Alignment(0.00, -1.00),
  //           end: Alignment(0, 1),
  //           colors: [Color(0xFF4E82EA), Color(0xFF245BC9)],
  //         ),
  //         borderRadius: BorderRadius.all(Radius.circular(7)),
  //         boxShadow: [
  //           BoxShadow(),
  //         ],
  //       ),
  //       height: height,
  //       width: width,
  //       child: Padding(
  //         padding: const EdgeInsets.all(7.0),
  //         child: Text(
  //           text,
  //           textAlign: TextAlign.center,
  //           style: const TextStyle(
  //             color: Colors.white,
  //             fontSize: 18,
  //             fontFamily: 'Poppins',
  //             fontWeight: FontWeight.w500,
  //           ),
  //         ),
  //       )),
  // );
  return Padding(
    padding: const EdgeInsets.only(top: 12, left: 10),
    child: Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: screenWidth * 0.01),
        GestureDetector(
          onTap: () async {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          },
          child: Image.asset(
            'assets/Group 48155.png',
            scale: 4,
            // height: screenHeight * 0.032,
          ),
        ),
        SizedBox(width: screenWidth * 0.02),
        Text(
          text,
          style: const TextStyle(
            // fontFamily: ,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppines',
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 15,

            // fontStyle: FontStyle.normal,
          ),
        )
      ],
    )),
  );
}
