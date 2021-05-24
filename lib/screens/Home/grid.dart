import 'package:flutter/material.dart';
import 'package:pokedex_app/screens/Details/pokemon_details.dart';
import '../../models/pokemon_model.dart';

Widget buildPokemonGrid(BuildContext context, List<Pokemon> list) {
  return GridView.count(
    padding: const EdgeInsets.all(15.0),
    crossAxisCount: 2,
    children: list
        .map((poke) => Hero(
              tag: poke.id,
              child: Card(
                elevation: 4,
                child: InkWell(
                  overlayColor:
                      MaterialStateProperty.all(Theme.of(context).accentColor),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PokemonDetails(poke)));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image:
                                DecorationImage(image: NetworkImage(poke.img))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          poke.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ))
        .toList(),
  );
}
