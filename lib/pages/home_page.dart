import 'package:flutter/material.dart';
import 'package:flutter_apps/data/pokemon_data.dart';
import 'package:flutter_apps/models/pokemon.dart';
import 'package:flutter_apps/pages/detail_page.dart';
import 'package:flutter_apps/widgets/pokemon_card.dart';
import 'package:flutter_apps/widgets/pokemon_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Pokemon> pokemon = dataPokemon;

  String _searchQuery = '';
  bool _showFavoriteOnly = false;
  final Set<String> _favoritePokemon = {};
  final TextEditingController _searchController = TextEditingController();

  void _toggleFavorite(String name) {
    setState(() {
      if (_favoritePokemon.contains(name)) {
        _favoritePokemon.remove(name);
      } else {
        _favoritePokemon.add(name);
      }
    });
  }

  Future<void> _openDetail(pokemon, bool isFavorite) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailPage(pokemon: pokemon, isFavorite: isFavorite),
      ),
    );

    if (result != null) {
      _favoritePokemon.add(pokemon.name);
    } else {
      _favoritePokemon.remove(pokemon.name);
    }
  }

  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    //filter pokemon berdasarkan kata kunci
    final filtered = dataPokemon.where((p) {
      final q = _searchQuery.toLowerCase();
      final matchesSearch = p.name.toLowerCase();

      final matchesFavorite =
          !_showFavoriteOnly || _favoritePokemon.contains(p.name);
      return matchesSearch.contains(q) && matchesFavorite;
    }).toList();

    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pokemon Go",
          style: TextStyle(
            fontFamily: 'PokemonHollow',
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),
        centerTitle: true,
        actions: [Text('$screenSize')],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search Pokemon",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Switch(
                  value: _showFavoriteOnly,
                  onChanged: (value) {
                    setState(() {
                      _showFavoriteOnly = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth <= 425) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final pokemon = filtered[index];
                      final isFavorite = _favoritePokemon.contains(
                        pokemon.name,
                      );

                      return PokemonList(
                        pokemon: pokemon,
                        isFavorite: isFavorite,
                        onTap: () {
                          _openDetail(pokemon, isFavorite);
                        },
                        onFavoriteTap: () {
                          _toggleFavorite(pokemon.name);
                        },
                        type: pokemon.type,
                      );
                    },
                    itemCount: filtered.length,
                  );
                } else {
                  int column = 2;
                  if (constraints.maxWidth > 768) column = 3;
                  if (constraints.maxWidth >= 1024) column = 4;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: column,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      final pokemon = filtered[index];
                      final isFavorite = _favoritePokemon.contains(
                        pokemon.name,
                      );

                      return PokemonCard(
                        pokemon: pokemon,
                        type: '',
                        isFavorite: isFavorite,
                        onTap: () {
                          _openDetail(pokemon, isFavorite);
                        },
                        onFavoriteTap: () {
                          _toggleFavorite(pokemon.name);
                        },
                      );
                    },
                    itemCount: filtered.length,
                  );
                }
                ;
              },
            ),
          ),
        ],
      ),
    );
  }
}
