import 'package:asc_portfolio/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

import '../../style/app_color.dart';

class ChangeSeatPage extends StatefulWidget {
  const ChangeSeatPage({Key? key}) : super(key: key);

  @override
  State<ChangeSeatPage> createState() => _ChangeSeatPageState();
}

class _ChangeSeatPageState extends State<ChangeSeatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appPurple,
        title: Image.asset("assets/images/logo.png", fit: BoxFit.fill,),
        centerTitle: true,
        shadowColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: FloatingActionButton.extended(
                  heroTag: 'Text',
                  label: Text("이동할 좌석을 선택해주세요.",style: TextStyle(fontSize: 13,color: Colors.white, fontWeight: FontWeight.w300),),// <-- Text
                  backgroundColor: AppColor.appPurple,
                  onPressed: ()  {
                  }
              ),
            ),
            Card(
              color: AppColor.appPurple,
              margin: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(20),
                width: 30,
                height: 60,
                child: TimerBuilder.periodic(Duration(seconds: 1),
                    builder: (context){
                      return Text(
                        '현재시간 : ${DateFormat('yyyy-MM-dd h시 mm분 ss초 a').format(DateTime.now().add(Duration(hours: 9)))
                        }',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),
                      );
                    }),
              ),
            ),
            SizedBox(height: 20,),
            Container(width: 500,
                child: Divider(color: Colors.black, thickness: 2.0)),
            SizedBox(height: 20),
            Card(
              color: Colors.grey,
              child: Row(
                children: [
                  FloatingActionButton.small(
                      heroTag: 'colorSelect',
                      backgroundColor: Colors.white,
                      onPressed: ()  {
                      }
                  ),
                  Text(" : 사용가능"),
                  FloatingActionButton.small(
                      heroTag: 'colorSelect2',
                      backgroundColor: AppColor.appPurple,
                      onPressed: ()  {
                      }
                  ),
                  Text(" : 사용불가능"),
                ],
              ),
            ),
            SizedBox(height: 100,),
            Row(
              children: [
                FloatingActionButton.extended(
                    heroTag: 'entrance',
                    label: Text('입구 >>'),// <-- Text
                    backgroundColor: AppColor.appPurple,
                    onPressed: ()  {
                    }
                ),
              ],
            ),

            SizedBox(height: 70),
            FloatingActionButton.extended(
                heroTag: 'Area1',
                label: Text('1번구역'),// <-- Text
                backgroundColor: AppColor.appPurple,
                onPressed: ()  {
                }
            ),
            SizedBox(height: 20),

            GridView.builder(

              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    if(index == 1) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => _buildPopupDialog(context),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white
                    ),
                    child: Text("index: $index"),
                  ),
                );
              },
            ),
            SizedBox(height: 70),
            FloatingActionButton.extended(
                heroTag: 'Area2',
                label: Text('2번구역'),// <-- Text
                backgroundColor: AppColor.appPurple,
                onPressed: ()  {
                }
            ),
            SizedBox(height: 20),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    if(index == 1) {
                      print("123");
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white
                    ),
                    child: Text("index: $index"),
                  ),
                );
              },
            ),
            SizedBox(height: 70),
            FloatingActionButton.extended(
                heroTag: 'Area3',
                label: Text('3번구역'),// <-- Text
                backgroundColor: AppColor.appPurple,
                onPressed: ()  {
                }
            ),
            SizedBox(height: 20),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    if(index == 1) {
                      print("123");
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white
                    ),
                    child: Text("index: $index"),
                  ),
                );
              },
            ),
            SizedBox(height: 70),
            FloatingActionButton.extended(
                heroTag: 'Area4',
                label: Text('4번구역'),// <-- Text
                backgroundColor: AppColor.appPurple,
                onPressed: ()  {
                }
            ),
            SizedBox(height: 20),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    if(index == 1) {
                      print("123");
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white
                    ),
                    child: Text("index: $index"),
                  ),
                );
              },
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.appPurple,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('해당 좌석으로 이동하시겠습니까?', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white), ),
        ],
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("선택한 좌석번호 : {%s}번", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () async {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            await showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialogChange(context),
            );
          },
          child: const Text('Yes', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),),
        ),
      ],
    );
  }

  Widget _buildPopupDialogChange(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.appPurple,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('좌석이동이 완료되었습니다.', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white), ),
        ],
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("이동한 좌석번호 : {%s}번", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () async {
            Navigator.pop(context);
          },
          child: const Text("OK", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),),
        ),
      ],
    );
  }
}
