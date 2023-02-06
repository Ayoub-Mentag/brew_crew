import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/settings_form.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'brew_list.dart';

//home contains : brew list widget && setting form

class Home extends StatelessWidget {
 final AuthService _auth = AuthService();

 

  @override
  Widget build(BuildContext context) {
    
    
    void  _showSettingPanel() {
      showModalBottomSheet(context: context, builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: SettingForm(), 
          );
      });
    }
    return StreamProvider<List<Brew>?>.value(
      initialData: null,
      value: DatabaseService().brews,
      child: Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        centerTitle: false,
        title: Text('Brew Crew'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            style: TextButton.styleFrom(
              primary: Colors.black, // Background Color
            ),
            onPressed: () async {
              await _auth.signOut();
            }, 
            icon: Icon(Icons.person), 
            label: Text('Log out')
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
              primary: Colors.black, // Background Color
            ),
            onPressed: () => _showSettingPanel(), 
            icon: Icon(Icons.settings), 
            label: Text('Setting'),
          ),
        ],
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/coffee_bg.png'),
              fit: BoxFit.cover,
            )
          ),
          child: BrewList(),
        ),
      ),
    );
  }
}

