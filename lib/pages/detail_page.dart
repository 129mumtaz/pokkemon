import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_apps/models/pokemon.dart';

class DetailPage extends StatelessWidget {
  final Pokemon pokemon;
  const DetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemon.name)),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(20),
              child: Image.asset(pokemon.image),
            ),
          ),
          Container(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 10.0),
            margin: EdgeInsetsDirectional.symmetric(horizontal: 10.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pikachu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                      width: 1,
                      color: Colors.blue,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Text(pokemon.type),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Base Power : ${pokemon.basePower}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(pokemon.description),
                SizedBox(height: 8,),
                Text('Skills', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Wrap(
                  children: pokemon.skills.map((e) => Container ()).toList(),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12,
                  ),
                  child: Row(
                    // children: [
                    //   Icon(Icons.star),
                    //   SizedBox(width: 10,),
                    //   Text('Waterboom'),
                    // ],
                  ),
                ),
                SizedBox(height: 8,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}