import 'package:flutter/material.dart';
import 'package:new_journal/screens/entry_form.dart';
import 'package:new_journal/screens/journal.dart';
import 'package:new_journal/widgets/journal_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatefulWidget {
  final SharedPreferences prefs;
  const MyApp({Key? key, required this.prefs}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const darkMode = 'dark';
  //theme is the variable that save the light or dark state
  bool get theme => widget.prefs.getBool(darkMode) ?? false;

  @override
  Widget build(BuildContext context) {
    //these are the routes for the pages
    final routes = {
      '/': (context) => Journal(
            prefs: widget.prefs,
            theme: themeChange,
            state: theme,
          ),
      '/add': (context) => const EntryForm(),
      '/drawer': (context) => JournalDrawer(
            prefs: widget.prefs,
            theme: themeChange,
            state: theme,
          )
      // '/details': (context) => const EntryDetails()
    };
    return MaterialApp(
        title: 'Flutter Demo',
        //this is the dark and light theme switch
        theme: getTheme(),
        initialRoute: '/',
        routes: routes);
  }

  ThemeData getTheme() => theme ? ThemeData.dark() : ThemeData.light();

  //this will save the state of the dark or light theme
  void themeChange(state) {
    setState(() {
      widget.prefs.setBool(darkMode, state);
    });
  }
}
