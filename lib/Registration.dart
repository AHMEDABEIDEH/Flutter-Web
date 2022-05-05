import 'package:flutter/material.dart';
import 'package:flutter_nav/Login.dart';
import 'package:flutter_nav/bottom_bar.dart';
import 'package:flutter_nav/navsignup.dart';
import 'package:flutter_nav/responsive.dart';
import 'package:flutter_nav/service/auth_service.dart';

import 'menu_drawer.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPage createState() => _RegistrationPage();
}

class _RegistrationPage extends State<RegistrationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  AuthService _authService = AuthService();

  bool _isObscure = true;
  bool _isObscure2 = true;
  final _formKey = GlobalKey<FormState>();
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
              child: navsignup(),
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
                        'Welcome !',
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
                        controller: _nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: new OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF077bd7)),
                          ),
                          labelText: 'Full Name',
                          hintText: 'Enter your full name',
                          icon: Icon(Icons.person),
                        ),
                        onChanged: (value) {},
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Full name can't be empty";
                          }

                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      width: 400,
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: new OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF077bd7)),
                          ),
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          icon: Icon(Icons.email),
                        ),
                        onChanged: (value) {},
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email can't be empty";
                          }

                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      width: 400,
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: new OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF077bd7)),
                          ),
                          labelText: 'Password',
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
                        onChanged: (value) {},
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password can't be empty";
                          }

                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      width: 400,
                      child: TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: _isObscure2,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: new OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF077bd7)),
                          ),
                          labelText: 'Confirm Password',
                          hintText: 'Confirm your password',
                          icon: Icon(Icons.password),
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure2
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure2 = !_isObscure2;
                                });
                              }),
                        ),
                        onChanged: (value) {},
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Confirm password can't be empty";
                          }

                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    // Container(
                    //   margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       if (_formKey.currentState!.validate()) {
                    //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //             content: Text("Sending data to Firebase")));
                    //       }
                    //     },
                    //     child: Text('Sign up'),
                    //   ),
                    // ),
                    // Container(
                    //   width: 140,
                    //   height: 50,
                    //   child: InkWell(
                    //     onTap: () {
                    //       _authService
                    //           .createPerson(
                    //               _nameController.text,
                    //               _emailController.text,
                    //               _passwordController.text)
                    //           .then((value) {
                    //         return Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) => LoginPage()));
                    //       });
                    //     },
                    //     child: Container(
                    //       padding: EdgeInsets.symmetric(vertical: 5),
                    //       decoration: BoxDecoration(
                    //           border: Border.all(color: Colors.white, width: 2),
                    //           //color: colorPrimaryShade,
                    //           borderRadius:
                    //               BorderRadius.all(Radius.circular(30))),
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(5.0),
                    //         child: Center(
                    //             child: Text(
                    //           "Sign up",
                    //           style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 15,
                    //           ),
                    //         )),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Container(
                      width: 140,
                      height: 50,
                      child: InkWell(
                        onTap: () {
                          _authService
                              .createPerson(
                                  _nameController.text,
                                  _emailController.text,
                                  _passwordController.text)
                              .then((value) {
                            return Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              //color: colorPrimaryShade,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Center(
                                child: Text(
                              "Sign up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            )),
                          ),
                        ),
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
