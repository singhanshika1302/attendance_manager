import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class EventCustomWidget extends StatelessWidget {
  final String eventName;
  final String description;
  final String societyName;
  final String departmentName;
  final String price;
  final String daysLeft;
  final String registrationUrl;
  // final String registered;

  const EventCustomWidget({
    Key? key,
    required this.eventName,
    required this.description,
    required this.societyName,
    required this.departmentName,
    required this.price,
    required this.daysLeft,
    required this.registrationUrl,
    // required this.registered,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      // margin: EdgeInsets.fromLTRB(15,2,15,2),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        
        // border: Border.all(color: const Color.fromARGB(255, 208, 23, 23)),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            eventName,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          // SizedBox(height: 8.0),
          Text(
            description,
            style: TextStyle(fontSize: 16.0),
          ),
          // SizedBox(height: 8.0),
          Text(
            societyName,
            style: TextStyle(fontSize: 14.0, color: Colors.grey),
          ),
          // SizedBox(height: 4.0),
          Text(
            departmentName,
            style: TextStyle(fontSize: 14.0, color: Colors.grey),
          ),
          // SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'date: $price',
                style: TextStyle(fontSize: 10),
              ),
              Text(
                'Venue : $daysLeft',
                style: TextStyle(fontSize: 10.0),
              ),
            
            
            ],
          ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width/2,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(const Color.fromRGBO(0, 75, 184, 1))
                    
                  ),
                  
                    onPressed: () {
                      print("button pressedlkjhgfds");
                        // _launchUrl(registrationUrl);
                      // Handle button tap
                    },
                    child: Text('Register',style: TextStyle(color: Colors.white),),
                  ),
              ),
            ),
        ],
      ),
    );
  }
// Future<void> _launchUrl(String registrationUrl) async {
//   Uri uri = Uri.parse(registrationUrl);
//   if (!await launchUrl(uri)) {
//     throw Exception('Could not launch $registrationUrl');
//   }
//   await launchUrl(uri);
// }

}
 
