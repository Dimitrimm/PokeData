import 'dart:convert';

class Pokemon {
  final String name;
  final String genus;
  final String primaryColor;
  final String id;
  final String pokedexNumber;

  final int height;
  final int weight;
  final int hp;
  final int attack;
  final int defense;
  final int speed;
  final int specialAttack;
  final int specialDefense;

  final Map<String, dynamic> typing;
  final Map<String, dynamic> abilities;
  final Map<String, dynamic> weaknesses;
  final Map<String, dynamic> advantages;

  Pokemon(
      this.name,
      this.genus,
      this.primaryColor,
      this.id,
      this.pokedexNumber,
      this.height,
      this.weight,
      this.hp,
      this.attack,
      this.defense,
      this.speed,
      this.specialAttack,
      this.specialDefense,
      this.typing,
      this.abilities,
      this.weaknesses,
      this.advantages);

  Pokemon.fromJson(Map<dynamic, dynamic> json)
      : name = json['name'] as String,
        genus = json['genus'] as String,
        primaryColor = json['primary_color'] as String,
        id = json['id'] as String,
        pokedexNumber = json['pokedex_number'] as String,
        height = int.parse(json['height']),
        weight = int.parse(json['weight']),
        hp = int.parse(json['hp']),
        attack = int.parse(json['attack']),
        defense = int.parse(json['defense']),
        speed = int.parse(json['speed']),
        specialAttack = int.parse(json['special_attack']),
        specialDefense = int.parse(json['special_defense']),
        typing = json['typing'],
        abilities = json['abilities'],
        weaknesses = json['weaknesses'],
        advantages = json['advantages'];
}
