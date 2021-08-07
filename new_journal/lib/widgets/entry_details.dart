import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EntryDetails extends StatelessWidget {
  final title;
  final body;
  final rating;
  final date;
  const EntryDetails({Key? key, this.title, this.body, this.rating, this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        //when and when not to display appbar
        appBar: orientation == Orientation.portrait ? aAppBar() : null,
        body: ListView(children: [
          Padding(
            //this will display title
            padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
            child: Text(title,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey)),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              body,
              style: TextStyle(fontSize: 30, color: Colors.lightBlue),
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Text(
                rating == 0 ? "Please Select" : rating.toString(),
                style: TextStyle(fontSize: 30),
              ))
        ]));
  }

  //creat the appbar widget
  PreferredSizeWidget aAppBar() {
    return AppBar(
      //date will display in appbar
      title: Text(date),
    );
  }
}
