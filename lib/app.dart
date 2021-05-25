import 'package:flutter/material.dart';
import 'package:pokedex_app/Provider/list_properties_provider.dart';
import 'package:provider/provider.dart';

import 'screens/Home/home_page.dart';

class Pokedex extends StatelessWidget {
  const Pokedex({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeData(
        primaryColor: Colors.teal,
        accentColor: Colors.tealAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.cyan,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal,
          centerTitle: true,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.tealAccent,
        ),
      ),
      home: ChangeNotifierProvider(
        create: (context) => ListProperties(
          isListMode: false,
          isSortAtoZ: true,
        ),
        child: HomePage(),
      ),
    );
  }
}
