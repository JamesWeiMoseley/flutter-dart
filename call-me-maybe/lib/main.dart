import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_3/myApp.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp
  ]);
  runApp(MyApp());
}
