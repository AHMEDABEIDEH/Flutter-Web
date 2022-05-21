import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nav/Usernav.dart';
import 'package:flutter_nav/display.dart';
import 'package:flutter_nav/responsive.dart';
import 'package:flutter_nav/widgets/NavDisplau.dart';

class mappage extends StatefulWidget {
  const mappage({Key? key}) : super(key: key);

  @override
  State<mappage> createState() => _mappageState();
}

class _mappageState extends State<mappage> {
  final user = FirebaseAuth.instance.currentUser!;

  final FirebaseAuth userId = FirebaseAuth.instance;

  //doc id

  List<String> docIDs = [];

  //query for only show  user's Maps
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('Maps')
        .where('Created By', isEqualTo: user.uid)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            print(user.uid);
            docIDs.add(document.reference.id);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              iconTheme: IconThemeData(color: Color(0xFF077bd7)),
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Robot Application",
                style: TextStyle(
                  color: Color(0xFF077bd7),
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  fontFamily: 'Raleway',
                  letterSpacing: 2,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 70),
              child: DisplaynavContents(),
            ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: FutureBuilder(
            future: getDocId(),
            builder: (context, snapshot) {
              return ListView.builder(
                  itemCount: docIDs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: GetImage(
                        documentId: docIDs[index],
                      ),
                    );
                  });
            },
          )),
        ],
      )),
    );
  }
}
