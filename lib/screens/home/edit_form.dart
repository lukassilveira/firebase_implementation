import 'package:firebase_implementation/models/user.dart';
import 'package:firebase_implementation/services/database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_implementation/shared/const.dart';
import 'package:provider/provider.dart';

import '../../services/database.dart';
import '../../shared/loading.dart';

class EditForm extends StatefulWidget {
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {

  final _formKey = GlobalKey<FormState>();

  //form values
  String _currentName;
  String _currentClassName;
  int _currentLevel;
  int _currentHealth;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.userId).userData,
      builder: (context, snapshot){

        if (snapshot.hasData){
          UserData userData = snapshot.data;
          return Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
                  child: Text(
                    'Edit your character',
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                ),
                TextFormField(
                  initialValue: userData.name,
                  decoration: textInputDecoration.copyWith(labelText: 'Name'),
                  validator: (val) {
                    val.isEmpty ? 'Please insert a name' : null;
                  },
                  onChanged: (val) {
                    setState(() {
                      _currentName = val;
                    });
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  initialValue: userData.className,
                  decoration: textInputDecoration.copyWith(labelText: 'Class'),
                  validator: (val) {
                    val.isEmpty ? 'Please insert a class' : null;
                  },
                  onChanged: (val) {
                    setState(() {
                      _currentClassName = val;
                    });
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  initialValue: userData.level.toString(),
                  decoration: textInputDecoration.copyWith(labelText: 'Level'),
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    val.isEmpty ? 'Please insert a level' : null;
                  },
                  onChanged: (val) {
                    setState(() {
                      _currentLevel = int.parse(val);
                    });
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  initialValue: userData.health.toString(),
                  decoration: textInputDecoration.copyWith(labelText: 'Health'),
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    val.isEmpty ? "Please insert your health" : null;
                  },
                  onChanged: (val) {
                    _currentHealth = int.parse(val);
                  },
                ),
                SizedBox(height: 20,),
                RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()){
                      await DatabaseService(uid: user.userId).updateUserData(
                        _currentName ?? userData.name,
                        _currentClassName ?? userData.className,
                        _currentLevel ?? userData.level,
                        _currentHealth ?? userData.health
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Submit'),
                ),
                SizedBox(height: 20,)
              ],
            ),
          );
        } else {
          return Loading();
        }

        
      }
      
      
    );
  }
}