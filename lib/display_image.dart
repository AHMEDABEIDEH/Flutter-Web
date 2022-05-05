import 'package:flutter/material.dart';
import 'package:flutter_nav/service/firebase_api.dart';
import 'package:flutter_nav/service/model_firebase.dart';

class ImagePage extends StatelessWidget {
  final FirebaseFile file;

  const ImagePage({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isImage = ['.jpeg', '.jpg', '.png'].any(file.name.contains);

    return Scaffold(
      appBar: AppBar(
        title: Text(file.name),
        centerTitle: true,
      ),
      body: isImage
          ? Container(
              alignment: Alignment.center,
              child: Image.network(
                file.url,
                height: 500,
                width: 500,
                fit: BoxFit.cover,
              ),
            )
          : Center(
              child: Text(
                'Cannot be displayed',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
    );
  }
}
