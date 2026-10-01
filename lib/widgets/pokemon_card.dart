import 'package:flutter/material.dart';
import 'package:flutter_apps/models/pokemon.dart';
import 'package:flutter_apps/pages/detail_page.dart';
import 'package:flutter_apps/widgets/type_chip.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override

  // function intent ke detail_page
  Widget build(BuildContext context) {
    void _detailPage(Pokemon pokemon) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DetailPage(pokemon: pokemon)),
      );
    }

    return InkWell(
      onTap: () {
        _detailPage(pokemon);
      },
      child: SizedBox(
        height: 100,
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Hero(
                tag: pokemon.name,
                child: Image.asset(
                  pokemon.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}