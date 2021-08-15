import 'package:proj_2/proj_2.dart';
import 'dart:io';
import 'dart:convert';

// const systemName = 'Solar System';

void main(List<String> arguments) {
  String jsonFile = arguments[0];
  File(jsonFile).readAsString().then((String json) {
    SpaceAdventure(
      planetarySystem: PlanetarySystem.fromMap(jsonDecode(json))
    ).start();
  });
}