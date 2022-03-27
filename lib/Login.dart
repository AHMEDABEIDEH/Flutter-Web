import 'package:flutter/material.dart';
import 'package:flutter_nav/Registration.dart';
import 'package:flutter_nav/bottom_bar.dart';
import 'package:flutter_nav/navBar.dart';
import 'package:flutter_nav/responsive.dart';

import 'menu_drawer.dart';

enum SearchType { web, mobile, text }

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  String myname = '';
  String check = '';
  bool ch = true;
  SearchType st = SearchType.web;
  double d = 10.5;
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromARGB(81, 36, 165, 224),
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              iconTheme: IconThemeData(color: Color(0xFF077bd7)),
              // backgroundColor: Colors.white,
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
              child: navBarContents(),
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child: Text(
                        'Welcome back !',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                        //  maxLines: 4,
                        //  overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 70, 0, 0),
                      width: 400,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: new OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF077bd7)),
                          ),
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          icon: Icon(Icons.email),
                        ),
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "Username can't be empty";
                          }

                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (String val) => myname = val,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      width: 400,
                      child: TextFormField(
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: new OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF077bd7)),
                          ),
                          labelText: 'Password',
                          // labelStyle:
                          //     TextStyle(color: Color.fromARGB(255, 48, 48, 48)),
                          hintText: 'Enter your password',
                          icon: Icon(Icons.password),
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (String val) => myname = val,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Sign in'),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height / 10,
                    ),
                    SizedBox(height: 10),
                    BottomBar(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
