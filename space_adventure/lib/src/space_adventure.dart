import 'dart:io';
import 'planetary_system.dart';
import 'planet.dart';

class SpaceAdventure {

  PlanetarySystem planetarySystem;
  SpaceAdventure({required this.planetarySystem});

  void start() {
    printGreeting();
    printName();
    print('Let\s go on an adventure!');
    if(planetarySystem.hasPlanets)
      startAdventure();
    else 
      print('Sorry, there are no planets to explore');
  }

  void printGreeting() {
    print('Welcome to the ${planetarySystem.name}!');
    print('There are ${planetarySystem.numOfPlanets} planets to explore.');
  }

  void printName() {
    print('What\s your name?');
    String name = stdin.readLineSync()!;
    print('Nice to meet you $name. My name Eliza, I\m an old friend of Alexa.');
  }

  void startAdventure() {
    Planet planet;
    print('Shall I randomly choose a planet for you to visit? (Y or N)');
    var answer = stdin.readLineSync()!;
      if(answer == 'Y') {
        planet = planetarySystem.randomPlanet();
        travelTo(planet);
      } else if(answer == 'N') {
        print('Name the planet you would like to visit.');
        final planetName = stdin.readLineSync()!;
        planet = planetarySystem.planetWithName(planetName);
        travelTo(planet);
      } else {
        print('Lets try this again...');
        startAdventure();
      }

  }

  void travelTo(Planet planet) {
    print('Travelling to ${planet.name}...');
    print('Arrived at ${planet.name}. ${planet.description}');
  }

}