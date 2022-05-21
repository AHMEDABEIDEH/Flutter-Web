import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_nav/Login.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_nav/UserPage.dart';
import 'package:flutter_nav/display.dart';
import 'home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Robot Application',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //  home: HomePage());
        home: UserPage());

    //home: DisplayPage());
    // home: AddStatusPage());
  }
// }
// import 'package:firebase_core/firebase_core.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_nav/display_image.dart';
// import 'package:flutter_nav/service/firebase_api.dart';
// import 'package:flutter_nav/service/model_firebase.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp();

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   static final String title = 'Firebase Download';

//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: title,
//         theme: ThemeData(primarySwatch: Colors.blue),
//         home: MainPage(),
//       );
// }

// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   late Future<List<FirebaseFile>> futureFiles;

//   @override
//   void initState() {
//     super.initState();

//     futureFiles = FirebaseApi.listAll('images/');
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: Text(MyApp.title),
//           centerTitle: true,
//         ),
//         body: FutureBuilder<List<FirebaseFile>>(
//           future: futureFiles,
//           builder: (context, snapshot) {
//             switch (snapshot.connectionState) {
//               case ConnectionState.waiting:
//                 return Center(child: CircularProgressIndicator());
//               default:
//                 if (snapshot.hasError) {
//                   return Center(child: Text('Some error occurred!'));
//                 } else {
//                   final files = snapshot.data!;

//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       buildHeader(files.length),
//                       const SizedBox(height: 12),
//                       Expanded(
//                         child: ListView.builder(
//                           itemCount: files.length,
//                           itemBuilder: (context, index) {
//                             final file = files[index];

//                             return buildFile(context, file);
//                           },
//                         ),
//                       ),
//                     ],
//                   );
//                 }
//             }
//           },
//         ),
//       );

//   Widget buildFile(BuildContext context, FirebaseFile file) => ListTile(
//         leading: ClipOval(
//           child: Image.network(
//             file.url,
//             width: 52,
//             height: 52,
//             fit: BoxFit.cover,
//           ),
//         ),
//         title: Text(
//           file.name,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             decoration: TextDecoration.underline,
//             color: Colors.blue,
//           ),
//         ),
//         onTap: () => Navigator.of(context).push(MaterialPageRoute(
//           builder: (context) => ImagePage(file: file),
//         )),
//       );

//   Widget buildHeader(int length) => ListTile(
//         tileColor: Colors.blue,
//         leading: Container(
//           width: 52,
//           height: 52,
//           child: Icon(
//             Icons.file_copy,
//             color: Colors.white,
//           ),
//         ),
//         title: Text(
//           '$length Files',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//             color: Colors.white,
//           ),
//         ),
//       );
// }
}
