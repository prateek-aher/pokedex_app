import 'package:flutter/material.dart';
import '../Details/pokemon_details.dart';
import '../../models/pokemon_model.dart';

Widget buildPokemonList(
    BuildContext context, AsyncSnapshot<List<Pokemon>> snapshot) {
  return ListView.builder(
      padding: const EdgeInsets.all(15.0),
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        return Hero(
          tag: snapshot.data[index].id,
          child: Card(
            // clipBehavior: Clip.none,
            margin: EdgeInsets.only(bottom: 15.0),
            elevation: 4,
            child: InkWell(
              overlayColor:
                  MaterialStateProperty.all(Theme.of(context).accentColor),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        PokemonDetails(snapshot.data[index])));
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
                          snapshot.data[index].img,
                          fit: BoxFit.cover,
                        ),
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
              ),
            ),
          ),
        );
      });
}
