import 'package:flutter/material.dart';
import 'package:new_journal/db/journal_db.dart';
import 'package:new_journal/model/journal_model.dart';
import 'package:new_journal/screens/horizontal_screen.dart';
import 'package:new_journal/screens/vertical_screen.dart';
import 'package:new_journal/widgets/journal_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/entry_details.dart';
import 'no_entries.dart';

class Journal extends StatefulWidget {
  final SharedPreferences prefs;
  final theme;
  final state;
  const Journal(
      {Key? key, required this.prefs, required this.theme, required this.state})
      : super(key: key);

  @override
  _JournalState createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //The Drawer and its parameters
      endDrawer: Drawer(
        child: JournalDrawer(
          prefs: widget.prefs,
          theme: widget.theme,
          state: widget.state,
        ),
      ),
      appBar: AppBar(
        title: Text(
          "My Journal",
        ),
        //changes the drawer icon to the settings icon
        actions: [
          Builder(
              //This changes the drawer's icon to the settings icon
              builder: (context) => IconButton(
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    icon: Icon(Icons.settings),
                  ))
        ],
      ),
      //Here we have the layoutbuilder that will show the horizontal or verticla widget
      body: Container(
        constraints: BoxConstraints(maxWidth: 800),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return constraints.maxWidth < 750 ? Vertical() : Horizontal();
          },
        ),
      ),
      //Add floating button that will take us the the add page
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/add').then((value) => setState(() {}));
        },
      ),
    );
  }
}
