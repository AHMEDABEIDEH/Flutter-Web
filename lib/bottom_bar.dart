import 'package:flutter_nav/widgets/bottom_bar_column.dart';
import 'package:flutter_nav/widgets/info_text.dart';
import 'package:flutter_nav/responsive.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // ignore: prefer_const_literals_to_create_immutables
            colors: [
              Color.fromARGB(81, 32, 117, 156),
              Color.fromARGB(81, 38, 138, 184)
            ],
            tileMode: TileMode.clamp),
      ),
      padding: EdgeInsets.all(30),
      //color: Colors.blueGrey[900],
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomBarColumn(
                heading: 'ABOUT',
                s1: 'Phone',
                s2: 'About Us',
                s3: '',
              ),
              Container(
                color: Colors.white,
                width: 2,
                height: 150,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoText(
                    type: 'Email',
                    text: 'kultur@iku.edu.tr.',
                  ),
                  SizedBox(height: 5),
                  InfoText(
                    type: 'Address',
                    text:
                        'Ataköy 7-8-9-10, E5 Karayolu Üzeri Ataköy Yerleşkesi, 34158 Bakırköy',
                  ),
                  SizedBox(height: 5),
                  InfoText(
                    type: 'Phone',
                    text: '(0212) 498 41 41',
                  )
                ],
              ),
            ],
          ),
          Divider(
            color: Colors.white,
          ),
          SizedBox(height: 20),
          Text(
            'Copyright © 2022 | Group 1',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
