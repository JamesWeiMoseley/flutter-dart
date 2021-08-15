class Planet {
    String name;
    String description;

    Planet({required this.name, required this.description});

    Planet.nullPlanet() : name = 'Unknown Planet', description = 'It is not in current System';

    static List<Planet> fromMaps(Iterable planetMaps) {
    return List<Planet>.from( 
      planetMaps.map(
        (item) => Planet(name: item['name'], description: item['description'])
      )
    );
  }

}