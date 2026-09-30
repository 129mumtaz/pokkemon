import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(33),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Hero(
            tag: 'pokemon-image',
            child: Image.asset(
              'assets/bulbasaur.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Row(
            children: [
              Text('Bulbasaur'),
          Text('Type Pokemon'),
           ],
          ),
        ],
      ),
    );
  }
}
