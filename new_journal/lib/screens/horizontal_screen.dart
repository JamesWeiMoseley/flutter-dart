import 'package:flutter/material.dart';
import 'package:new_journal/db/journal_db.dart';
import 'package:new_journal/model/journal_model.dart';
import 'package:new_journal/screens/no_entries.dart';
import 'package:new_journal/widgets/entry_details.dart';

class Horizontal extends StatefulWidget {
  const Horizontal({Key? key}) : super(key: key);

  @override
  _VerticalState createState() => _VerticalState();
}

class _VerticalState extends State<Horizontal> {
  var title = '';
  var body = '';
  var rating = 0;
  var date = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
            //--------LEFT CONTAINER --------------------
            child: FutureBuilder<List<Entry>>(
                //calls get entries to recieve all the data from the database
                future: JournalDB.instance.getEntries(),
                builder:
                    //the future builder
                    (BuildContext context,
                        AsyncSnapshot<List<Entry>> snapshot) {
                  // print(!snapshot.hasData);
                  if (!snapshot.hasData) {
                    return Center(child: Text('Loading...'));
                  }
                  return snapshot.data!.isEmpty
                      ? Welcome()
                      : ListView(
                          children: snapshot.data!.map((e) {
                          //What is displayed on the front page
                          return Center(
                              child: ListTile(
                                  title: Text(e.title),
                                  subtitle: Text(e.date),
                                  onTap: () => displayText(e)));
                        }).toList());
                })),
        VerticalDivider(width: 0),
        //--------RIGHT CONTAINER --------------------
        Expanded(
            child: Container(
          child: EntryDetails(
              title: title, body: body, rating: rating, date: date),
        ))
      ],
    ));
  }

  void displayText(e) {
    setState(() {
      title = e.title;
      body = e.body;
      rating = e.rating;
      date = e.date;
    });
  }
}
