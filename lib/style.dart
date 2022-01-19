import 'package:flutter/material.dart';

var theme = ThemeData(
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: Colors.blueGrey,
    )
  ),


    iconTheme: IconThemeData(color: Colors.black),
    appBarTheme: AppBarTheme(
        color:Colors.white,
        actionsIconTheme:IconThemeData(color: Colors.black)
    ),
    textTheme: TextTheme(
      bodyText2: TextStyle(color:Colors.red),
      headline6: TextStyle(
        color:Colors.black,
      ),
    )//todo 위에 씸대에터를 쓰면 깔끔해보인다는 장점이 있다.

  //todo text()는 bodyText2 가져다가 씀
  // listTile()은 Subtitle1
  // TextButton()은 button
  // Appbar()는 headline6


);  //todo 소괄호 안에 모든 스타일을 넣을 수 있다.
// todo 장점은 모든 팀데이터 안에 넣어놓으면 모든 아이콘 스타일이 적용된다.
