import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_implementation/models/character.dart';
import 'package:firebase_implementation/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference characterCollection = Firestore.instance.collection("characters");

  Future updateUserData(String name, String className, int level, int health) async {
    return await characterCollection.document(uid).setData({
      'name': name,
      'className': className,
      'level': level,
      'health': health
    });
  }

  //character list
  List<CharacterModel> _characterListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return CharacterModel(
        className: doc.data['className'], 
        name: doc.data['name'],
        level: doc.data['level'],
        health: doc.data['health']
      );
    }).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot documentSnapshot){
    return UserData(
      uid: documentSnapshot.data['uid'],
      name: documentSnapshot.data['name'],
      className: documentSnapshot.data['className'],
      health: documentSnapshot.data['health'],
      level: documentSnapshot.data['level'],
    );
  }

  //get party stream
  Stream<List<CharacterModel>> get characters {
    return characterCollection.snapshots().map(_characterListFromSnapshot);
  }

  //get user doc stream
  Stream<UserData> get userData {
    return characterCollection.document(uid).snapshots()
    .map(_userDataFromSnapshot);
  }

}