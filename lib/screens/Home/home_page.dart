import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/pokemon_model.dart';
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
  bool isSortAtoZ = true;
  List<Pokemon> list;

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        setState(() {
          isListMode = !isListMode;
        });
        break;
      case 1:
        setState(() {
          isSortAtoZ = !isSortAtoZ;
        });
        break;
    }
  }

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
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.white),
            ),
            child: PopupMenuButton<int>(
              onSelected: (item) => onSelected(context, item),
              color: Theme.of(context).scaffoldBackgroundColor,
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  textStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  value: 0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(isListMode
                          ? Icons.grid_view
                          : Icons.format_list_bulleted),
                      const SizedBox(width: 8),
                      Text(
                        isListMode ? 'View grid' : 'View list',
                      )
                    ],
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem<int>(
                  textStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  value: 1,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(isSortAtoZ
                          ? CupertinoIcons.sort_up
                          : CupertinoIcons.sort_down),
                      const SizedBox(width: 8),
                      Text(
                        isSortAtoZ ? 'Sort Z-A' : 'Sort A-Z',
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Pokemon>>(
          future: service.fetchAllPokemons(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              print(snapshot.error);
              return null;
            }
            list = snapshot.data;
            list.sort((a, b) => a.name.compareTo(b.name));
            list = isSortAtoZ ? list : list.reversed.toList();
            return isListMode
                ? buildPokemonList(context, list)
                : buildPokemonGrid(context, list);
          },
        ),
      ),
    );
  }
}
