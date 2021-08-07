import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JournalDrawer extends StatefulWidget {
  final SharedPreferences prefs;
  final theme;
  final state;
  const JournalDrawer(
      {Key? key, required this.prefs, required this.theme, required this.state})
      : super(key: key);

  @override
  _JournalDrawerState createState() => _JournalDrawerState();
}

class _JournalDrawerState extends State<JournalDrawer> {
  bool darkTheme = false;

  void initState() {
    super.initState();
    darkTheme = widget.prefs.getBool('darkTheme') ?? false;
  }

  //stright forward drawer that has a switch
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
              title: Text(
            "Settings",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          )),
          ListTile(
            title: Text("Change Theme"),
            trailing: Switch(
              value: widget.state,
              onChanged: (value) {
                widget.theme(value);
                // print('value is $value');
              },
            ),
          )
        ],
      ),
    );
  }
}
