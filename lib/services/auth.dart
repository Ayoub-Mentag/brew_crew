import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in anon
  Future signInAnon() async {
      try {
        UserCredential result =  await _auth.signInAnonymously();
        User? user = result.user;
        return user;
      } catch(e) {
        print(e.toString());
        return null;
      }
  }
  //sign in with email & password

  //register with email & password

  //sign out
}


/*
  What we ve done in this lesson
  1- enable authentication methods in our firebase project.
    * sign in anon --> done
    * sign in with email & password
    * register with email & password
    * sign out
  2- create services/auth.dart/AuthService class which is a service that will handle
    all the cases of authentication.
  **************
  it knows which back-end to sync up with due to Google Service Json
*/