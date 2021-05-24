import 'package:flutter/material.dart';
import '../Details/pokemon_details.dart';
import '../../models/pokemon_model.dart';

Widget buildPokemonList(BuildContext context, List<Pokemon> list) {
  return ListView.builder(
      padding: const EdgeInsets.all(15.0),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Hero(
          tag: list[index].id,
          child: Card(
            // clipBehavior: Clip.none,
            margin: EdgeInsets.only(bottom: 15.0),
            elevation: 4,
            child: InkWell(
              overlayColor:
                  MaterialStateProperty.all(Theme.of(context).accentColor),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PokemonDetails(list[index])));
              },
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: MediaQuery.of(context).size.width - 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Image.network(
                          list[index].img,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      Text(
                        list[index].name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
}
