import 'package:asc_portfolio/pages/nav_drawer_page.dart';
import 'package:asc_portfolio/pages/payment/payment_page.dart';
import 'package:asc_portfolio/pages/specific_seat_page.dart';
import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  bool loginCheck = true;

  final List _widgetOptions = [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: AppColor.appPURPLE ,
              child: Image.asset("assets/images/logo_set_splash.png")),
            Container(
              padding: EdgeInsets.all(20),
              child: FloatingActionButton.extended(
                  heroTag: 'Text',
                  label: Text("좌석 선택후 시간을 선택해주세요.",style: TextStyle(fontSize: 13,color: Colors.white, fontWeight: FontWeight.w300),),// <-- Text
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SpecificSeatPage()));
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
    Column(
      children: [
        Card(
            margin: EdgeInsets.all(50.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            elevation: 6.0,
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                width: 300,
                height: 300,
                child: QrImage(
                  data: "https://www.daum.net/",
                  version: QrVersions.auto,
                  backgroundColor: Colors.white,
                ))),
        Text("주의 ! QR코드를 타인에게 노출하지마세요.",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black,fontSize: 16)),

        SizedBox(height: 30),
        FloatingActionButton.extended(
            heroTag: 'UserName',
            icon: Icon(Icons.account_box),
            label: Text('홍길동님', style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 16),),// <-- Text
            backgroundColor: AppColor.appPURPLE,
            onPressed: ()  {
            }
          ),
        SizedBox(height: 10),
          FloatingActionButton.extended(
              heroTag: 'UserSeat',
              icon: Icon(Icons.event_seat),
              label: Text('좌석 : 12번', style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 16),),// <-- Text
              backgroundColor: AppColor.appPURPLE,
              onPressed: ()  {
              }
          ),
        SizedBox(height: 10),
        FloatingActionButton.extended(
            heroTag: 'UserTime',
            icon: Icon(Icons.timer),
            label: Text('남은시간: 3시간 10분', style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 16),),// <-- Text
            backgroundColor: AppColor.appPURPLE,
            onPressed: ()  {
            }
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton.extended(
            heroTag: 'Pass2',
            icon: Icon(Icons.credit_card_outlined),
            label: Text('내 이용권정보', style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 16),),// <-- Text
            backgroundColor: AppColor.appPURPLE,
            onPressed: ()  {
            }
        ),
        Image.asset("assets/images/logo_pass.png"),
        SizedBox(height: 10),
        FloatingActionButton.extended(
            heroTag: 'Pass',
            icon: Icon(Icons.calendar_month),
            label: Text('남은기간: 3일 4시간 20분', style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 16),),// <-- Text
            backgroundColor: AppColor.appPURPLE,
            onPressed: ()  {
            }
        ),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: AppColor.appPURPLE,
        title: Image.asset("assets/images/logo.png", fit: BoxFit.fill,),
        centerTitle: true,
        shadowColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () => {

              if(loginCheck == true) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentPage()))
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginDemo())),
                }
              },
            icon: loginCheck ? Icon(Icons.add_card) : Icon(Icons.account_circle),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.appPURPLE,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex, //현재 선택된 Index
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "좌석",
            icon: Icon(Icons.event_seat),
          ),
          BottomNavigationBarItem(
            label: "QR코드",
            icon: Icon(Icons.qr_code_2),
          ),
          BottomNavigationBarItem(
            label: "내 이용권",
            icon: Icon(Icons.account_circle_rounded),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
