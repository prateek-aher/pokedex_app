import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon_model.dart';

Widget buildPokemonGrid(
    BuildContext context, AsyncSnapshot<List<Pokemon>> snapshot) {
  print(snapshot.connectionState);
  return GridView.count(
    padding: const EdgeInsets.all(15.0),
    crossAxisCount: 2,
    children: snapshot.data
        .map((poke) => Card(
              elevation: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(poke.img))),
                  ),
                  Text(
                    poke.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ))
        .toList(),
  );
}
