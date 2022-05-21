import 'package:flutter/material.dart';

import 'package:flutter_nav/Usernav.dart';
import 'package:flutter_nav/bottom_bar.dart';

import 'package:flutter_nav/helperPage.dart';
import 'package:flutter_nav/responsive.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:carousel_slider/carousel_slider.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPage createState() => _UserPage();
}

class _UserPage extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Color.fromARGB(81, 36, 165, 224),
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
              child: UsernavContents(),
            ),
      //  drawer: MenuDrawer(),
      body: Padding(
        padding: EdgeInsets.all(0.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    // ignore: prefer_const_literals_to_create_immutables
                    colors: [
                      Color.fromARGB(81, 32, 117, 156),
                      Color.fromARGB(255, 16, 49, 99)
                    ]),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    child: CarouselSlider(
                      items: [
                        Container(
                          //width: 800,
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage('assets/images/img1.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //2nd Image of Slider
                        Container(
                          //width: 800,
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage('assets/images/img2.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        //3rd Image of Slider
                        Container(
                          //width: 800,
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage('assets/images/img3.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        height: 450.0,
                        enlargeCenterPage: false,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.5,

                        //viewportFraction: 1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height / 10,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Press to start scanning",
                          style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox.fromSize(
                          size: Size(56, 56),
                          child: ClipOval(
                            child: Material(
                              color: Color.fromARGB(255, 57, 176, 227),
                              child: InkWell(
                                splashColor: Color.fromARGB(255, 76, 153, 175),
                                onTap: () {},
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.play_arrow_rounded,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Press to stop scanning",
                          style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox.fromSize(
                          size: Size(56, 56),
                          child: ClipOval(
                            child: Material(
                              color: Color.fromARGB(255, 57, 176, 227),
                              child: InkWell(
                                splashColor: Color.fromARGB(255, 76, 153, 175),
                                onTap: () {},
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.stop_rounded,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: 80,
                  ),

                  Container(
                    width: 140,
                    height: 50,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => mappage()));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 57, 176, 227),
                                width: 2),
                            //color: colorPrimaryShade,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                              child: Text(
                            "View Maps",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          )),
                        ),
                      ),
                    ),
                  ),
                  // FutureBuilder(
                  //   future: FireStoreDataBase().getData(),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasError) {
                  //       return const Text(
                  //         "Something went wrong",
                  //       );
                  //     }
                  //     if (snapshot.connectionState == ConnectionState.done) {
                  //       return Image.network(
                  //         snapshot.data.toString(),
                  //       );
                  //     }
                  //     return const Center(child: CircularProgressIndicator());
                  //   },
                  // ),

                  // Container(
                  //   width: 600,
                  //   height: 400,
                  //   color: Colors.white,
                  // ),

                  SizedBox(height: 100),
                  BottomBar(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




// class FireStorageMethod extends ChangeNotifier {
//   FireStorageMethod();

//   static Future<dynamic> loadImage(BuildContext context, String Image) async {
//     return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
//   }
// }
