import 'package:flutter/material.dart';
import '../../models/pokemon_model.dart';

class PokemonDetails extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonDetails(this.pokemon, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: Stack(
        children: [
          Positioned(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width -
                (MediaQuery.of(context).size.width * 0.04),
            top: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.02,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text(pokemon.name),
                    Container(
                      width: double.infinity,
                      // height: MediaQuery.of(context).size.height * 0.04,
                      child: Text(
                        'Height: ${pokemon.height}\nWeight: ${pokemon.weight}',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 20, height: 2.0),
                      ),
                    ),
                    Text('Types',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.type
                          .map((element) => Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                padding: EdgeInsets.all(12.0),
                                decoration: ShapeDecoration(
                                  color: Colors.greenAccent,
                                  shape: StadiumBorder(),
                                ),
                                child: Text(
                                  element,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.purple,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    Text('Weakness',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      runSpacing: 10,
                      spacing: 10,
                      children: pokemon.weaknesses
                          .map((element) => Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                padding: EdgeInsets.all(12.0),
                                decoration: ShapeDecoration(
                                  color: Colors.redAccent,
                                  shape: StadiumBorder(),
                                ),
                                child: Text(
                                  element,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    pokemon.nextEvolution != null
                        ? Text('Next Evolution',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))
                        : SizedBox(),
                    pokemon.nextEvolution != null
                        ? Wrap(
                            alignment: WrapAlignment.spaceEvenly,
                            runSpacing: 10,
                            spacing: 10,
                            children: pokemon.nextEvolution
                                .map((element) => Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      padding: EdgeInsets.all(12.0),
                                      decoration: ShapeDecoration(
                                        color: Colors.greenAccent,
                                        shape: StadiumBorder(),
                                      ),
                                      child: Text(
                                        element.name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.purple,
                                        ),
                                      ),
                                    ))
                                .toList(),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Hero(
              tag: pokemon.id,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(pokemon.img),
                  fit: BoxFit.cover,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
