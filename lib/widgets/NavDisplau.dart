import 'package:flutter/material.dart';
import 'package:flutter_nav/UserPage.dart';

class DisplaynavContents extends StatefulWidget {
  DisplaynavContents();

  @override
  _DisplaynavContents createState() => _DisplaynavContents();
}

class _DisplaynavContents extends State<DisplaynavContents> {
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
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white.withOpacity(0.5),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: screenSize.width / 4,
              ),
              Text(
                'Robot Application',
                style: TextStyle(
                  color: Color(0xFF077bd7),
                  fontSize: 26,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(width: screenSize.width / 15),
              SizedBox(width: screenSize.width / 45),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[1] = true : _isHovering[1] = false;
                  });
                },
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => UserPage()));
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Back To Main',
                      style: TextStyle(
                          color: _isHovering[1]
                              ? Color(0xFF077bd7)
                              : Color(0xFF077bd7),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Visibility(
                      maintainAnimation: true,
                      maintainState: true,
                      maintainSize: true,
                      visible: _isHovering[1],
                      child: Container(
                        height: 2,
                        width: 20,
                        color: Color(0xFF051441),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: screenSize.width / 45),
            ],
          ),
        ),
      ),
    );
    //);
  }
}
