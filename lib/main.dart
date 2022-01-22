import 'package:flutter/material.dart';
import './style.dart' as style;

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';

void main(){
  runApp(MaterialApp(
    theme: style.theme,




      home : MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {


var tab = 0;

// 첫째화면을 누르면 0, 둘째화면을 누르면 1로 표시


  getData() async {
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    var result2 =jsonDecode(result.body);
    print(result2[0]['likes']);

  }

  @override
  void initState() {
    super.initState();
    getData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton( icon: Icon(Icons.add_box_outlined),
            onPressed: (){},)
        ],
      ),


    body: [Home(), Text('샵페이지')][tab],



    bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: Colors.black,
      showSelectedLabels: false,
      showUnselectedLabels: false,

      onTap: (i){
        setState(() {
          tab = i;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: 'Shopping'),
      ],
    ),



    );

  }
}


class Home extends StatelessWidget {
  const Home ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (c, i) {
        return Column(
          children: [
            Image.network('https://codingapple1.github.io/kona.jpg'),
            Text('좋아요'),
            Text('글쓴이'),
            Text('글내용'),
          ],

        );
      },
    );
  }}


