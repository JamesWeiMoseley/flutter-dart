import 'package:flutter/material.dart';

class Resume extends StatefulWidget {
  const Resume({Key? key}) : super(key: key);

  @override
  _ResumeState createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  final String name = 'James Moseley';
  final String website = 'github.com/jamesweimoseley';
  final String email = 'moseleyj@oregonstate.edu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[100],
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(children: <Widget>[
            //this is the tile card at the top with name, web, and email
            Align(
                alignment: Alignment.centerLeft,
                child: Text(name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.lightBlue))),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(website,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  email,
                  style: TextStyle(fontSize: 15),
                )),
            //this is where the cards start: there is 8 of them
            for (var i = 0; i < 8; i++)

              // the for loop will return 8 containers
              Container(
                color: i % 2 == 1 ? null : Colors.purple[50],
                padding: EdgeInsets.fromLTRB(0, 20, 20, 10),
                child: Column(children: <Widget>[
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Software Developer Intern',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.lightBlue))),
                  // row contains the second line: e corp, 2016, etc
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('E Corp',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15))),
                      Text('2016-Present',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Text('Springfield, OR',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15))
                    ],
                  ),
                  //final element in the column which is the longer
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vel convallis ligula. Etiam mollis nunc quam, ut tristique enim efficitur id. Nulla nec nibh odio.",
                        style: TextStyle(fontSize: 15),
                      )),
                ]),
              )
          ]),
        ));
  }
}
