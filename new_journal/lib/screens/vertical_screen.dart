import 'package:flutter/material.dart';
import 'package:new_journal/db/journal_db.dart';
import 'package:new_journal/model/journal_model.dart';
import 'package:new_journal/screens/no_entries.dart';
import 'package:new_journal/widgets/entry_details.dart';

class Vertical extends StatefulWidget {
  const Vertical({Key? key}) : super(key: key);

  @override
  _VerticalState createState() => _VerticalState();
}

class _VerticalState extends State<Vertical> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: FutureBuilder<List<Entry>>(
                //calls get entries to recieve all the data from the database
                future: JournalDB.instance.getEntries(),
                builder:
                    //the future builder
                    (BuildContext context,
                        AsyncSnapshot<List<Entry>> snapshot) {
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
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EntryDetails(
                                              title: e.title,
                                              body: e.body,
                                              rating: e.rating,
                                              date: e.date)))));
                        }).toList());
                })));
  }
}
