
class Pokemon {
  final int id;
  final String name;
  final int height;
  final int weight;
  Pokemon(this.id, this.name, this.height, this.weight);

  Pokemon.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        height = json['height'],
        weight = json['weight'];
}