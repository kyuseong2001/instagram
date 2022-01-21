import 'package:flutter/material.dart';
import './style.dart' as style;

import 'package:http/http.dart' as http;
import 'dart:convert';

//c import './style.dart' as style;
//c 변수명이 겹치면 as 라는 키워드로 사용한다.
//c theme: style.theme,
//c 변수를 다른 파일에서 쓰기 싫으면 _언더바를 변수앞에 붇인다.

void main() {
  runApp(MaterialApp(
    theme: style.theme,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  var tab = 0;
  var map = {'name':'john', 'age':16};
  var data = [];
  //c 비어있는 스테이트를 만들어 놓는다.





  //c map ['name']; 이름을 불러주는 법
  //c 불러온 데이터 값이 대괄호[]로 시작하면 무조건 리스트이다.



  getData() async {
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    var result2 = jsonDecode(result.body);
    setState(() {  //c set state를 써야 이미지를 저장할 수 있다 변하니까.
      data = result2;   //c 리절트2의 결과의 값을 Data 라는 변수에 저장한다. 대문자 소문자 잘 봐야 한다.
    });
  }

  @override
  void initState() {    // c initState안에는 async를 붙일수 없게 되어있다.
    super.initState();
    getData();


   //c 서버랑 데이터를 주고받을때는 문자만 나눌수 있다. json을 리스트, 맵의 형태로 뽑아서 쓰기위해서 변환함수 아래를 써야한다.
   //c   print(jsonDecode(result.body));
    //c 리스트 맵의 형태로 뽑아서 써야한다.


  } //c myapp 앱이 로드되자마자 서버에 겟요청을 할때




//c 위에 변수에 스테이트에 번호를 지정해놓는다.
  //c state에 따라 tab이 어떻게 보일지를 지정해 놓는다.
  //c ontab 함수를 만들어 놓는다. 리스트형태에서 i번째의 버튼을 보여준다.
  //c 버튼에 번호를 리스트 형태에 보여준다

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_box_outlined),
            iconSize: 30,
          )
        ],
      ),
      body: [Home( data : data ), Text('쇼핑')][tab],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false, //c 아이콘 밑에 텍스트바를 안보이게 하는방법

        onTap: (i) {
          setState(() {
            tab = i;
          });
        },




        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'shop'),
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key, this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {


    print(data);

    //c 프린트는 함수같이 생긴곳에서만 쓸수 있다.
    //c 옆에있는 데이터가 비어있는지 안비어있는지 알려주는 함수

    if (data.isNotEmpty){
      return ListView.builder(
          itemCount:3,
          itemBuilder: (c, i) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(data[i]['image']), // c http 인터넷상의 이미지 경로를 넣어야 할때는 Image.network
                  Text(data[i]['likes'].toString(),),
                  Text(data[i]['user']),
                  Text(data[i]['content']),
                ],
              ),
            );
          });
    } else{
      return Text('LODING');
    }
  }
}



// if 데이터에 뭐가 있으면 보여주세요