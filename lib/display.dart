// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

const kBackgroundColor = Color(0xFFF1EFF1);
const kPrimaryColor = Color(0xFF035AA6);
const kSecondaryColor = Color(0xFFFFA41B);
const kTextColor = Color(0xFF000839);
const kTextLightColor = Color(0xFF747474);
const kBlueColor = Color(0xFF40BAD5);

const kDefaultPadding = 20.0;

// our default Shadow
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);

class GetImage extends StatelessWidget {
  final String documentId;

  GetImage({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference Maps = FirebaseFirestore.instance.collection('Maps');

    return FutureBuilder<DocumentSnapshot>(
      future: Maps.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          Size size = MediaQuery.of(context).size;
          DateTime dt = (data['createdAt'] as Timestamp).toDate();
          var d12 = DateFormat('MM/dd/yyyy, hh:mm:ss a').format(dt);
          // it enable scrolling on small devices
          return SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Hero(
                            tag: '${data['createdAt']}',
                            child: Image.network(
                              '${data['imageURl']}',
                              fit: BoxFit.cover,
                              width: 350,
                              height: 250,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding / 3),
                          child: Text(
                            '$d12',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        SizedBox(height: kDefaultPadding),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Text('Loading');
      }),
    );
  }
}

class GetMaps extends StatelessWidget {
  final String documentId;

  GetMaps({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference Maps = FirebaseFirestore.instance.collection('Maps');

    return FutureBuilder<DocumentSnapshot>(
      future: Maps.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          DateTime dt = (data['createdAt'] as Timestamp).toDate();
          var d12 = DateFormat('MM/dd/yyyy, hh:mm:ss a').format(dt);
          return Text('''createdAt:  $d12
         ''');
        }
        return Text('Loading');
      }),
    );
  }
}
