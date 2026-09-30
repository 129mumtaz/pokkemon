import 'package:flutter/material.dart';
import 'package:pokkemon/widgets/pokemon_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon'),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          children: [
            PokemonCard(),
          ],
        ),
      ),
    );
  }
}