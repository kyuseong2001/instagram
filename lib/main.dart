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



addData(a){
  setState(() {
    data.add(a);
  });
}


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


    body: [Home(data:data,addData:addData), Text('샵페이지')][tab],



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


class Home extends StatefulWidget {
  const Home ({Key? key, this.data,this.addData}) : super(key: key);
  final data;
  final addData;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



  //c 스크롤바 높이를 측정하려면 스테이트를 먼저 만든다.

  var scroll = ScrollController();

  //c 스크롤 정보자료를 저장할 수 있는 저장함을 만들어주는 클래스
  //c 현재의 스크롤바를 계속 항상 체크를 해줘야하기때문에 initState를
  //c 설치해주고 리스너를 설치해줘야 한다. 항상 감시를 해줘야한다.

getMore()async{
  var result = await http.get(Uri.parse('https://codingapple1.github.io/app/more1.json'));
  var result2 = jsonDecode(result.body);
   widget.addData(result2);

}
  @override
  void initState() {
    super.initState();
    scroll.addListener(() {
      //c scroll이라는 변수가 변할때마다 감시해주는 함수

      if (scroll.position.pixels == scroll.position.maxScrollExtent){

      getMore();


      };

      //c print(scroll.position.userScrollDirection); 유저가 스크롤 하는 방향을 검사할 수 있다.

      //c print (scroll.position.maxScrollExtent);  스크롤바를 최대로 내릴수 있는 높이를 알려주는 함수

      //c 스크롤바를 내린 높이를 계속 측정해 주는 함수이다.
      //c
    });
  }


  @override
  Widget build(BuildContext context) {

   if(widget.data.isNotEmpty){
      return ListView.builder(
        itemCount: widget.data.length,
        controller: scroll,
        //c 그럼 유저가얼마니스크롤했는지 알아서 전부다 저장해주는 고마운 클래스
        itemBuilder: (c, i) {
          return Column(
            children: [
              Image.network(widget.data[i]['image']),
              Text('좋아요 ${widget.data[i]['likes'].toString()}'),
              Text(widget.data[i]['user']),
              Text(widget.data[i]['content']),
            ],

          );
        },
      );
    } else {
      return Text('Loading');
    }


  }}


