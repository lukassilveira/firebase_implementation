import 'package:flutter/material.dart';
import 'package:firebase_implementation/models/character.dart';

class CharacterTile extends StatelessWidget {

  final CharacterModel character;
  
  CharacterTile({this.character});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 4, 20, 4),
        child: ListTile(
          leading: Text(
            character.health.toString(),
            style: TextStyle(
              fontSize: 30
            ),
          ),
          title: Text(
            character.name + " - Level " + character.level.toString()
          ),
          subtitle: Text(
            character.className
          ),
        ),
      ),
    );
  }
}