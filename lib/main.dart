import 'dart:async';

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

var data = [];


getData() async {
  var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));


  if(result.statusCode == 200){

  } else {
    result.statusCode == 400;
  }


  var result2 = jsonDecode(result.body);

 setState(() {
   data = result2;
 });

}

  @override
  void initState() {
    super.initState();
      getData();
  }

  // https://codingapple1.github.io/app/data.json'




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


    body: [Home(data:data), Text('샵페이지')][tab],



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
  const Home ({Key? key, this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {

   if(data.isNotEmpty){
      return ListView.builder(
        itemCount: 3,
        itemBuilder: (c, i) {
          return Column(
            children: [
              Image.network(data[i]['image']),
              Text('좋아요 ${data[i]['likes'].toString()}'),
              Text(data[i]['user']),
              Text(data[i]['content']),
            ],

          );
        },
      );
    } else {
      return Text('Loading');
    }


  }}


