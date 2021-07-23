import 'package:flutter/material.dart';
import 'package:project_3/tabs/business.dart';
import 'package:project_3/tabs/predictor.dart';
import 'package:project_3/tabs/resume.dart';

class MainTabController extends StatelessWidget {
  const MainTabController({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              // tab icons
              Tab(icon: Icon(Icons.face)),
              Tab(icon: Icon(Icons.feed)),
              Tab(icon: Icon(Icons.help_outline)),
            ],
          ),
          centerTitle: true,
          title: Text(title),
        ),
        body: TabBarView(
          // the three different tabs functions
          children: [
            BusinessCard(),
            Resume(),
            Predictor(),
          ],
        ),
      ),
    );
  }
}
