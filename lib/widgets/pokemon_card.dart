import 'package:flutter/material.dart';
import 'package:flutter_apps/models/pokemon.dart';
import 'package:flutter_apps/pages/detail_page.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {

      //intent ke detail
  void _detailPage(Pokemon pokemon) {
    Navigator.push(context, 
    MaterialPageRoute(
    builder: (_) => DetailPage(pokemon: pokemon)));
  }

    return InkWell(
      onTap: (){
        _detailPage(pokemon);
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        clipBehavior: Clip.antiAlias,
        child: Hero(
          tag: pokemon.name,
          child: Image.asset(
            pokemon.image,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}