import 'package:brew_crew/models/my_user.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(apiKey: "AIzaSyBHu-vIkXdLYeqMLpvMlEinrKsaCFJ6Le8",
                             appId: "",
                             messagingSenderId: "", 
                             projectId: "brew-crew-9e451")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //the wrapper now can access to the return value of Stream of auth;
    return StreamProvider<MyUser?>.value(
      initialData: null,//added to remove error
      value: AuthService().user,
      child: const MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
