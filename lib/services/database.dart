import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  
  final String? uid;
  DatabaseService({this.uid });
  
  //collection reference
  // Wehere we're gonna storing brew data
  //'brews' if not found, firestore will create it for us;
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  //sugare is String cuz we will show it later to screen
  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars' : sugars,
      'name' : name,
      'strength' : strength,
    });
  }

  //get brews stream
  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }
}