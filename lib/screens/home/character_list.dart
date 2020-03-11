import 'package:flutter/material.dart';
import 'package:firebase_implementation/models/character.dart';
import 'package:provider/provider.dart';

class CharacterList extends StatefulWidget {
  @override
  _CharacterListState createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  @override
  Widget build(BuildContext context) {

    final characters = Provider.of<List<CharacterModel>>(context);

    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index){
        return CharacterTile(character: characters[index]);
      },
    );
  }
}