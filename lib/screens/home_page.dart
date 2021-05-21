import 'package:flutter/material.dart';
import '../models/pokemon_model.dart';
import '../services/pokemon_service.dart';
import 'grid.dart';
import 'list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokemonService service;
  bool isListView = false;
  // Future<List<Pokemon>> pokemonList;

  @override
  void initState() {
    super.initState();
    service = PokemonService();
    // pokemonList = service.fetchAllPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
        elevation: 8,
        actions: [
          IconButton(
              tooltip: isListView ? 'Show grid' : 'Show list',
              icon: Icon(isListView ? Icons.grid_view : Icons.view_list),
              onPressed: () {
                setState(() {
                  isListView = !isListView;
                });
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.filter_alt_outlined),
      ),
      drawer: Drawer(),
      body: Center(
        child: FutureBuilder(
          future: service.fetchAllPokemons(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasError) print(snapshot.error);

              return isListView
                  ? buildPokemonList(context, snapshot)
                  : buildPokemonGrid(context, snapshot);
            }
          },
        ),
      ),
    );
  }
}
