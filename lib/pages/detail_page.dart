import 'package:flutter/material.dart';
import 'package:pokkemon/data/pokemon_data.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nama Pokemon')),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/pikachu.jpg'),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pikachu', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                    width: 1, 
                    color: Colors.blue,
                    style: BorderStyle.solid,
                    )
                  ),  
                  child: Text('Electric')
                  ),
                  SizedBox(height: 8),
                  Text('Base Power: 55', 
                        style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black,
                        )
                      ),
                      SizedBox(height: 8),
                      Text('Deskripsi', 
                        style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black,
                        )
                      ),
                      SizedBox(height: 8),
                      Text(
                        pokemonData[0].description, 
                        textAlign: TextAlign.justify,
                      ),
              ],
            ),

          )
        ],
      ),
    );
  }
}
