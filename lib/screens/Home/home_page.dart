import 'package:flutter/material.dart';
import '../../services/pokemon_service.dart';
import 'grid.dart';
import 'list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokemonService service;
  bool isListMode = false;

  @override
  void initState() {
    super.initState();
    service = new PokemonService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
        elevation: 8,
        actions: [
          IconButton(
              tooltip: isListMode ? 'Show list' : 'Show grid',
              icon: Icon(
                  isListMode ? Icons.grid_view : Icons.format_list_bulleted),
              onPressed: () {
                setState(() {
                  isListMode = !isListMode;
                });
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.filter_alt_outlined),
      ),
      body: Center(
        child: FutureBuilder(
          future: service.fetchAllPokemons(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return null;
            } else
              return isListMode
                  ? buildPokemonList(context, snapshot)
                  : buildPokemonGrid(context, snapshot);
          },
        ),
      ),
    );
  }
}
