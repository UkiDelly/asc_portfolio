import 'package:asc_portfolio/pages/home_page.dart';
import 'package:asc_portfolio/pages/suggest_board/suggest_board_detail.dart';
import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuggestBoardPage extends StatefulWidget {
  const SuggestBoardPage({super.key});

  @override
  State<SuggestBoardPage> createState() => SuggestBoardPageState();

}

class SuggestBoardPageState extends State<SuggestBoardPage> {

  final List SUGGEST_LIST = ["결제관련", "이용관련", "FAQ", "계정탈퇴"];
  final List ICON_LIST = [Icon(Icons.paypal, size: 120,), Icon(Icons.report, size: 120,),
    Icon(Icons.report, size: 120,), Icon(Icons.account_circle, size: 120,)];

  get dashBg => Column(
    children: <Widget>[
      Expanded(
        child: Container(color: AppColor.appPurple),
        flex: 2,
      ),
      Expanded(
        child: Container(color: Colors.transparent),
        flex: 5,
      ),
    ],
  );

  get content => Container(
    child: Column(
      children: <Widget>[
        header,
        grid,
      ],
    ),
  );

  get header => ListTile(
    contentPadding: EdgeInsets.only(left: 20, right: 20, top: 50),
    title: Text(
      '건의게시판',
      style: TextStyle(color: Colors.white),
    ),
    subtitle: Text(
      '건의 내용을 선택해 주세요',
      style: TextStyle(color: Colors.white, fontSize: 10),
    ),
    trailing: CircleAvatar(
        radius: 30.0,
        backgroundColor: Colors.black12,
        child: IconButton(
          icon: Icon(Icons.home),
          iconSize: 30,
          color: Colors.white,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SuggestBoardDetail()));
          },
        )
    ),
  );

  get grid => Expanded(
    child: Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GridView.count(
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        crossAxisCount: 2,
        childAspectRatio: .90,
        children: List.generate(SUGGEST_LIST.length, (index) {
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 100, bottom: 16),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SuggestBoardDetail()));
                      },
                      icon: ICON_LIST[index],
                    ),
                  ),
                  SizedBox(height: 70,),
                  Text(SUGGEST_LIST[index])
                ],
              ),
            ),
          );
        }),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[dashBg, content],
      ),
    );
  }
}