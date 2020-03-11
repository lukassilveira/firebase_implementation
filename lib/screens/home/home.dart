import 'package:firebase_implementation/models/character.dart';
import 'package:flutter/material.dart';
import '../../services/auth.dart';
import 'package:firebase_implementation/services/database.dart';
import 'package:provider/provider.dart';
import 'character_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final AuthService _auth = AuthService();

    return StreamProvider<List<CharacterModel>>.value(
      value: DatabaseService().characters,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Party'),
          backgroundColor: Colors.brown[400],
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person), 
              label: Text('Sign Out'),
            )
          ],
        ),
        backgroundColor: Colors.yellow[100],
        body: CharacterList(),
      ),
    );
  }
}