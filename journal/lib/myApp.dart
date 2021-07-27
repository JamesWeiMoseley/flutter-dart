import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:journal/screens/journal.dart';
import 'screens/homepage.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Journal',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        initialRoute: '/home',
        routes: {
          '/home': (context) => MyHomePage(title: "homepage round worked"),
          '/journal': (context) => const Journal(),
        });
  }
}
