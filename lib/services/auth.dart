import 'package:brew_crew/models/my_user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create user obj based on FirebaseUser
  MyUser? _userFromFirebseUser(User? user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  //auth change user stream (will return different value depends on auth)
  Stream<MyUser?> get user {
    return _auth.authStateChanges()
        //.map((User? user) => _userFromFirebseUser(user));
        .map(_userFromFirebseUser);
  }

  //sign in anon
  Future signInAnon() async {
      try {
        UserCredential result =  await _auth.signInAnonymously();
        User? user = result.user;
        return _userFromFirebseUser(user);
      } catch(e) {
        print(e.toString());
        return null;
      }
  }
  //sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      //Create a new document for the user with the uid
      await DatabaseService(uid: user?.uid).updateUserData('0', 'new crew member', 100);
      return _userFromFirebseUser(user);
    } catch(e) {
        print(e.toString());
        return null;
    }
  }


  //sign out
  //it is Future cuz it takes sometimes to complete
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}


/*
  We create in the previous lesson the function that wil listen to auth;
  Now we need to listen :) ; 
  and to do that we will use a Provider in the root widget;
  
*/