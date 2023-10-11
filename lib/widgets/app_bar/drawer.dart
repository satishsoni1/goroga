import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final Uri _privacyPolicy =
      Uri.parse('https://rogalife.com/pages/app-terms-of-service');

  final Uri _terms = Uri.parse('https://rogalife.com/pages/terms-conditions');

  final Uri _dataPrivacy =
      Uri.parse('https://rogalife.com/pages/privacy-policy');

  final Uri _support = Uri.parse('https://rogalife.com/pages/faq');

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topRight,
        child: Drawer(
          width: MediaQuery.of(context).size.width / 1.5,
          backgroundColor: Color.fromARGB(255, 224, 245, 243),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              AppBar(
                backgroundColor: Color.fromARGB(255, 224, 245, 243),
                automaticallyImplyLeading:
                    false, // Hide the default back button
                elevation: 0,
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Color.fromRGBO(16, 106, 94, 1),
                    ),
                    onPressed: () {
                      // Handle close button tap
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Settings",
                  style: TextStyle(
                      color: Color.fromRGBO(16, 106, 94, 1),
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  launchUrl(_privacyPolicy);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 224, 245, 243), backgroundColor: Colors.white, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                  ),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.lock_outline_sharp,
                    color: Color.fromRGBO(16, 106, 94, 1),
                  ),
                  title: Text(
                    'Privacy Policy',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle button tap
                  launchUrl(_terms);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 224, 245, 243), backgroundColor: Colors.white, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                  ),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.file_copy_sharp,
                    color: Color.fromRGBO(16, 106, 94, 1),
                  ),
                  title: Text('Terms',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle button tap
                  launchUrl(_dataPrivacy);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 224, 245, 243), backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                  ), // Text color
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.list,
                    color: Color.fromRGBO(16, 106, 94, 1),
                  ),
                  title: Text('Data Privacy',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle button tap
                  launchUrl(_support);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 224, 245, 243), backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                  ), // Text color
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.question_mark,
                    color: Color.fromRGBO(16, 106, 94, 1),
                  ),
                  title: Text(
                    'Support/FAQs',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle button tap
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 224, 245, 243), backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                  ), // Text color
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.logout_outlined,
                    color: Color.fromRGBO(16, 106, 94, 1),
                  ),
                  title: Text('Logout',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ]),
          ),
        ));
  }
}
