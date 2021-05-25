import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/Provider/list_properties_provider.dart';
import 'package:provider/provider.dart';
import '../../models/pokemon_model.dart';
import '../../services/pokemon_service.dart';
import 'items/grid.dart';
import 'items/list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokemonService service;
  List<Pokemon> list;

  void onSelected(ListProperties listProp, int item) {
    switch (item) {
      case 0:
        listProp.changeViewMode();
        break;

      case 1:
        listProp.changeOrder();
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
          Consumer<ListProperties>(builder: (context, listProp, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.white),
              ),
              child: PopupMenuButton<int>(
                onSelected: (item) => onSelected(listProp, item),
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
                        Icon(listProp.isListMode
                            ? Icons.grid_view
                            : Icons.format_list_bulleted),
                        const SizedBox(width: 8),
                        Text(
                          listProp.isListMode ? 'View grid' : 'View list',
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
                        Icon(listProp.isSortAtoZ
                            ? CupertinoIcons.sort_up
                            : CupertinoIcons.sort_down),
                        const SizedBox(width: 8),
                        Text(
                          listProp.isSortAtoZ ? 'Sort Z-A' : 'Sort A-Z',
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
        ],
      ),
      body: Center(
        child: Consumer<ListProperties>(builder: (context, listProp, child) {
          return FutureBuilder<List<Pokemon>>(
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
              list = listProp.isSortAtoZ ? list : list.reversed.toList();
              return listProp.isListMode
                  ? buildPokemonList(context, list)
                  : buildPokemonGrid(context, list);
            },
          );
        }),
      ),
    );
  }
}
