import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// this will launch website, email, phone number
void _launchExternalLink(String url) => launch(url);

//beginning of class
class BusinessCard extends StatelessWidget {
  const BusinessCard({Key? key}) : super(key: key);

  //variables
  final String name = 'James Moseley';
  final String title = 'Developer Extroadinairee';
  final String phoneNumber = '555 555 5555';
  final String github = 'github.com/jamesweimoseley';
  final String email = 'moseleyj@oregonstate.edu';

  //build function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // background color
        backgroundColor: Colors.purple[100],
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: SizedBox(
                    child: Image.asset('assets/pic.jpeg'),
                    width: 120,
                    height: 120,
                  )),
              Padding(
                  // my name at the top
                  padding: EdgeInsets.all(12.0),
                  child: Text(name,
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.w100,
                          fontSize: 23))),
              Padding(padding: EdgeInsets.all(6.0), child: Text(title)),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: GestureDetector(
                    //sms link
                    onTap: () => _launchExternalLink("sms:6263213720"),
                    child: Text(phoneNumber,
                        style: TextStyle(color: Colors.purpleAccent)),
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        // website link
                        GestureDetector(
                          onTap: () => _launchExternalLink(
                              "https://github.com/jamesweimoseley"),
                          child: Text(github,
                              style: TextStyle(color: Colors.purpleAccent)),
                        ),
                        GestureDetector(
                            //email link
                            onTap: () => _launchExternalLink(
                                'mailto:smith@example.org?subject=News&body=New%20plugin'),
                            child: Text(email,
                                style: TextStyle(color: Colors.purpleAccent)))
                      ]))
            ])));
  }
}
