import 'package:flutter/material.dart';
import 'package:flutter_nav/Login.dart';
import 'package:firebase_core/firebase_core.dart';

import 'home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Robot Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: HomePage());
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Error');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return HomePage();
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
