import 'package:flutter/material.dart';

var theme = ThemeData(
  //c ThemeData 쓰면 깔끔해보인다는 장점이 있다.


  bottomNavigationBarTheme: BottomNavigationBarThemeData(
  selectedItemColor: Colors.black,
  ),




  iconTheme: IconThemeData(color: Colors.black),

  appBarTheme: AppBarTheme(
    color: Colors.white,
    titleTextStyle: TextStyle(color:Colors.black,
    fontSize: 20),
    actionsIconTheme: IconThemeData(
    color: Colors.black)
    ),


  //c 모든 텍스트 스타일 지정하는방법 아래
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: Colors.white54,
      textStyle: TextStyle(
        color:Colors.black,
      )
    )

  )




  );




//c text()는 bodyText2 가져다가 씀
//c listTile()은 Subtitle1
//c TextButton()은 button
//c Appbar()는 headline6
//c 소괄호 안에 모든 스타일을 넣을 수 있다.
//c 장점은 모든 팀데이터 안에 넣어놓으면 모든 아이콘 스타일이 적용된다.
