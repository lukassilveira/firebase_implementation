import 'package:flutter/material.dart';
import 'package:firebase_implementation/models/character.dart';

class CharacterTile extends StatelessWidget {

  final CharacterModel character;
  
  CharacterTile({this.character});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(),
    );
  }
}