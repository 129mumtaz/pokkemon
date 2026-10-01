import 'package:flutter/material.dart';

class TypeChip extends StatelessWidget {
  final String type;
  const TypeChip({super.key, required this.type});

  Color _typeColor(){
    if(type.contains('Water')) return Colors.blue;
    if(type.contains('Poison')) return Colors.purple;
    if(type.contains('Grass')) return Colors.green;
    if(type.contains('Electric')) return Colors.amber;
    if(type.contains('Dragon')) return Colors.indigo;
    if(type.contains('Fire')) return Colors.red;
    if(type.contains('Ice')) return Colors.teal;
    if(type.contains('Normal')) return Colors.grey;
    if(type.contains('Fighting')) return Colors.orange;
    return Colors.amber;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: _typeColor().withOpacity(0.15),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: _typeColor(), width: 1)
      ),
      child: Text(type),
    );
  }
}