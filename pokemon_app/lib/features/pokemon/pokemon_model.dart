import 'package:equatable/equatable.dart';

class PokemonModel extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final int height;
  final int weight;
  final List<String> types;
  final List<String> abilities;

  const PokemonModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.height,
    required this.weight,
    required this.types,
    required this.abilities,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['sprites']['other']['official-artwork']['front_default'] ?? 
               json['sprites']['front_default'] ?? '',
      height: json['height'],
      weight: json['weight'],
      types: (json['types'] as List)
          .map((type) => type['type']['name'] as String)
          .toList(),
      abilities: (json['abilities'] as List)
          .map((ability) => ability['ability']['name'] as String)
          .toList(),
    );
  }

  @override
  List<Object> get props => [id, name, imageUrl, height, weight, types, abilities];
}

class PokemonListModel extends Equatable {
  final String name;
  final String url;

  const PokemonListModel({
    required this.name,
    required this.url,
  });

  factory PokemonListModel.fromJson(Map<String, dynamic> json) {
    return PokemonListModel(
      name: json['name'],
      url: json['url'],
    );
  }

  String get id => url.split('/').where((element) => element.isNotEmpty).last;

  @override
  List<Object> get props => [name, url];
}
