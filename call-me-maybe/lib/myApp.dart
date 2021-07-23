import 'package:flutter/material.dart';
import 'package:project_3/tabs.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: MainTabController(
          title: "Call Me Maybe Project",
        ));
  }
}
