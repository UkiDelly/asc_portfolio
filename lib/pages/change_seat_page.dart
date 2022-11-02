import 'package:asc_portfolio/pages/specific_seat_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

import '../style/app_color.dart';

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
        backgroundColor: AppColor.appPURPLE,
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
                  backgroundColor: AppColor.appPURPLE,
                  onPressed: ()  {
                  }
              ),
            ),
            Card(
              color: AppColor.appPURPLE,
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
                      backgroundColor: AppColor.appPURPLE,
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
                    backgroundColor: AppColor.appPURPLE,
                    onPressed: ()  {
                    }
                ),
              ],
            ),

            SizedBox(height: 70),
            FloatingActionButton.extended(
                heroTag: 'Area1',
                label: Text('1번구역'),// <-- Text
                backgroundColor: AppColor.appPURPLE,
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
                     // Navigator.push(context, MaterialPageRoute(builder: (context) => SpecificSeatPage()));
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
                backgroundColor: AppColor.appPURPLE,
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
                backgroundColor: AppColor.appPURPLE,
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
                backgroundColor: AppColor.appPURPLE,
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
}
