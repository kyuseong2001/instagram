import 'package:flutter/material.dart';


class Upload extends StatelessWidget {
  const Upload({Key? key,this.userImage}) : super(key: key);
  final userImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'This is Google Fonts'),


        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.file(userImage),
            Text('이미지업로드화면'),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                    Icons.close)
            ),
          ],
        )
    );
  }
}