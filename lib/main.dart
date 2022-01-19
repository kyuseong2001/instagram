import 'package:flutter/material.dart';
import'./style.dart' as style; // 경로


// todo 변수중복을 막기위해서는 타입을 as 옆에 써주고 변수아래 사용한 값의 앞에 타입을 넣는다.
// todo 변수 앞에 _ 언더바를 쓰면 다른 파일에서는 절대 사용할 수 없는 변수가 된다.  var _vard1; 이런식으로


void main() {
  runApp(
      MaterialApp(

    theme:style.theme,
          home: MyApp()
    ),
  );
}





class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Instagram',style: TextStyle(color: Colors.black)),
        actions: [Icon(Icons.add_box_outlined)],),
      body: Theme(
          data:ThemeData(
          ), child:Container(

      )),



      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.home_outlined),
              Icon(Icons.shopping_bag_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
