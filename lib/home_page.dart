import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nav/bottom_bar.dart';
import 'package:flutter_nav/responsive.dart';
import 'package:flutter_nav/top_bar_contents.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'Styles/icons.dart';
import 'menu_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
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
              child: TopBarContents(),
            ),
      drawer: MenuDrawer(),
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
                children: [
                  Stack(
                    children: [
                      Container(),
                      Container(
                        height: 200,
                        width: 200,
                        padding: EdgeInsets.fromLTRB(40, 30, 0, 0),
                        margin: EdgeInsets.fromLTRB(230, 150, 0, 0),
                        child: Text(
                          "welcome !",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 450,
                        padding: EdgeInsets.fromLTRB(40, 30, 0, 0),
                        margin: EdgeInsets.fromLTRB(230, 190, 0, 0),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas pharetra lectus mauris, et commodo arcu venenatis non. Pellentesque non lacus ligula. Proin bibendum nunc mauris.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        height: 300,
                        width: 350,
                        margin: EdgeInsets.fromLTRB(800, 100, 0, 0),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/Main.png'),
                              fit: BoxFit.contain),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height / 10,
                  ),
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
