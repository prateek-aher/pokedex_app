import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon_model.dart';

class PokemonService {
  static const String _kAPIUrl =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  Future<List<Pokemon>> fetchAllPokemons() async {
    List<Pokemon> pokemons = <Pokemon>[];
    http.Response response = await http.get(Uri.parse(_kAPIUrl));
    if (response.statusCode == 200) {
      List<dynamic> pokemonObjects = jsonDecode(response.body)['pokemon'];
      pokemonObjects.forEach((poke) => pokemons.add(Pokemon.fromJson(poke)));
    } else {
      print('Status = ${response.statusCode}');
    }
    return pokemons;
  }
}
