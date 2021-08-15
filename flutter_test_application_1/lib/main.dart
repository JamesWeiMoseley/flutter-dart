import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/AppTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme().buildThemeData(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final StreamController s = StreamController();

  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    for (int i = 0; i <= 30; i++) {
      await Future.delayed(Duration(seconds: 1));

      s.sink.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: StreamBuilder(
              stream: s.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError)
                  return Text("error");
                else if (snapshot.connectionState == ConnectionState.waiting)
                  return CircularProgressIndicator();
                return (Text('${snapshot.data}'));
              })),
    );
  }
}
