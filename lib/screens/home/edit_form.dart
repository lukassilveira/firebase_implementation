import 'package:flutter/material.dart';
import 'package:firebase_implementation/shared/const.dart';

class EditForm extends StatefulWidget {
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Edit your character',
            style: TextStyle(
              fontSize: 20
            ),
          )
        ],
      ),
    );
  }
}