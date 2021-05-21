import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon_model.dart';

Widget buildPokemonList(
    BuildContext context, AsyncSnapshot<List<Pokemon>> snapshot) {
  return ListView.builder(
      padding: const EdgeInsets.all(15.0),
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.2,
          child: Card(
            clipBehavior: Clip.none,
            margin: EdgeInsets.only(bottom: 15.0),
            elevation: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  snapshot.data[index].img,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                Text(
                  snapshot.data[index].name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
